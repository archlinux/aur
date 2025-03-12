{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use list literal" #-}
module Main where

import System.IO (hFlush, stdin, stdout, stderr, hGetEcho, hSetEcho, hPutStr, hPutChar, hPutStrLn)
import Data.Char (ord, chr, toUpper)
import Data.Map (Map, empty, insertWith, member, (!))
import qualified Data.Map as DM
import Data.List (elemIndex)
import System.Environment (getArgs)
import System.Directory (getHomeDirectory)
import System.Info (os)
import Text.Read (readMaybe)
import Control.Applicative (liftA2)
import Control.Monad (liftM, unless)
import Control.Exception (IOException, catch, bracket_)
import System.Exit (exitWith, ExitCode (ExitFailure))

currentVersion :: String
currentVersion = "0.1.14.3"

-- ┌───────────────────────────┐
-- │ GENERAL-PURPOSE FUNCTIONS │
-- └───────────────────────────┘

factorial :: Integer -> Integer
factorial n = product [1..n]

factorial' :: Integer -> Integer -> Integer
factorial' n m = product [(n-m+1)..n]

cnk :: Integer -> Integer -> Integer
cnk n k = div (factorial' n k) (factorial k)

length' :: [a] -> Integer
length' = toInteger . length

take' :: Integer -> [a] -> [a]
take' 0 _ = []
take' _ [] = []
take' n (a:as) = a : take' (n-1) as

insertAt :: a -> Integer -> [a] -> [a]
insertAt a 0 lst = a:lst
insertAt a n (l:lst) = l : insertAt a (n-1) lst
insertAt _ _ _ = []

break' :: (Eq a) => a -> [a] -> ([a], [a])
break' _ [] = ([],[])
break' a (a':rest)
  | a == a' = ([], rest)
  | otherwise = let (res1, res2) = break' a rest in (a' : res1, res2)

dropElementInfo :: ([a], Integer) -> (Integer, Integer)
dropElementInfo (src, m) = (length' src, m)

class Shifting a where
  shift :: a -> Integer

instance (Shifting a) => Shifting [a] where
  shift = sum . map shift

instance Shifting Char where
  shift = toInteger . ord

combineHashing :: (a -> Integer -> b) -> (b -> Integer -> c) -> (a -> Integer -> Integer -> c)
combineHashing f g a = g . f a

mapHashing :: (Shifting b) => (a -> Integer -> b) -> (a -> Integer) -> ([a] -> Integer -> [b])
mapHashing _ _ [] _ = []
mapHashing f spr (a : as) key = b : mapHashing f spr as nextKey
  where
    (keyDiv, keyMod) = divMod key $ spr a
    b = f a keyMod
    nextKey = keyDiv + shift b

composeHashing :: (Shifting b) => (a -> Integer -> b) -> (a -> Integer) -> (b -> Integer -> c) -> (a -> Integer -> c)
composeHashing f spr g a key = g b nextKey
  where
    (keyDiv, keyMod) = divMod key $ spr a
    b = f a keyMod
    nextKey = keyDiv + shift b

-- ┌───────────────────────────┐
-- │ HASH GENERATING FUNCTIONS │
-- └───────────────────────────┘

chooseOrdered :: (Eq a, Shifting a) => ([a], Integer) -> Integer -> [a]
chooseOrdered (_, 0) _ = []
chooseOrdered ([], _) _ = []
chooseOrdered (src, m) key = curElt : chooseOrdered (filter (/= curElt) src, m - 1) nextKey
  where
    (keyDiv, keyMod) = divMod key $ length' src
    curElt = src !! fromIntegral keyMod
    nextKey = keyDiv + shift curElt

shuffleList :: (Eq a, Shifting a) => [a] -> Integer -> [a]
shuffleList src = chooseOrdered (src, length' src)

chooseOrderedSpread :: (Integer, Integer) -> Integer
chooseOrderedSpread (n, m) = factorial' n m

chooseOrderedSpread' :: ([a], Integer) -> Integer
chooseOrderedSpread' = chooseOrderedSpread . dropElementInfo

mergeTwoLists :: (Shifting a) => ([a], [a]) -> Integer -> [a]
mergeTwoLists ([], lst2) _ = lst2
mergeTwoLists (lst1, []) _ = lst1
mergeTwoLists (elt1:rest1, elt2:rest2) key
  | curKey < spr1 = elt1 : mergeTwoLists (rest1, elt2:rest2) (curKey + shift elt1)
  | otherwise = elt2 : mergeTwoLists (elt1:rest1, rest2) (curKey - spr1 + shift elt2)
  where
    spr1 = mergeTwoListsSpread (length' rest1, length' rest2 + 1)
    spr2 = mergeTwoListsSpread (length' rest1 + 1, length' rest2)
    curKey = mod key (spr1 + spr2)

mergeTwoListsSpread :: (Integer, Integer) -> Integer
mergeTwoListsSpread (m1, m2) = div (factorial (m1 + m2)) (factorial m1 * factorial m2)

mergeTwoListsSpread' :: ([a], [a]) -> Integer
mergeTwoListsSpread' (lst1, lst2) = mergeTwoListsSpread (length' lst1, length' lst2)

mergeLists :: (Shifting a) => [[a]] -> Integer -> [a]
mergeLists [] _ = []
mergeLists [l] _ = l
mergeLists [l1, l2] key = mergeTwoLists (l1, l2) key
mergeLists (l:ls) key = mergeTwoLists (l, mergeLists ls keyMod) nextKey
  where
    (keyDiv, keyMod) = divMod key $ mergeListsSpread $ map length' ls
    nextKey = keyDiv + shift l

mergeListsSpread :: [Integer] -> Integer
mergeListsSpread amts = div (factorial $ sum amts) (product $ map factorial amts)

mergeListsSpread' :: [[a]] -> Integer
mergeListsSpread' = mergeListsSpread . map length'

chooseAndMerge :: (Eq a, Shifting a) => [([a], Integer)] -> Integer -> [a]
chooseAndMerge = composeHashing
  (mapHashing chooseOrdered chooseOrderedSpread')
  (product . map chooseOrderedSpread')
  mergeLists

chooseAndMergeSpread :: [(Integer, Integer)] -> Integer
chooseAndMergeSpread amts = (product . map chooseOrderedSpread) amts * (mergeListsSpread . map snd) amts

chooseAndMergeSpread' :: [([a], Integer)] -> Integer
chooseAndMergeSpread' = chooseAndMergeSpread . map dropElementInfo

getHash :: (Eq a, Shifting a) => [([a], Integer)] -> Integer -> Integer -> [a]
getHash = combineHashing chooseAndMerge shuffleList

-- ┌────────────────┐
-- │ ERROR HANDLING │
-- └────────────────┘

data Trace = String :=> [Trace] deriving (Read, Show)

data Handle a = Content a | Error Trace deriving (Read, Show)

liftH2 :: String -> String -> (a -> b -> c) -> (Handle a -> Handle b -> Handle c)
liftH2 _ _ f (Content a) (Content b) = Content (f a b)
liftH2 msg1 msg2 _ (Error tr1) (Error tr2) = Error $ "Double trace:" :=>
  [
    msg1 :=> [tr1],
    msg2 :=> [tr2]
  ]
liftH2 msg1 _ _ (Error tr) _ = Error (msg1 :=> [tr])
liftH2 _ msg2 _ _ (Error tr) = Error (msg2 :=> [tr])

raiseH' :: (Monad m) => (a -> m (Handle b)) -> (Handle a -> m (Handle b))
raiseH' f (Content a) = f a
raiseH' _ (Error tr) = return (Error tr)

fmapE :: (Trace -> Trace) -> Handle a -> Handle a
fmapE _ (Content a) = Content a
fmapE f (Error tr) = Error (f tr)

instance Functor Handle where
  fmap = liftM
instance Applicative Handle where
  pure = Content
  mf <*> ma = case mf of
    Error tr -> case ma of
      Error tr' -> Error ("Double trace:" :=> [tr, tr'])
      _ -> Error tr
    Content f -> fmap f ma
instance Monad Handle where
  return = pure
  mval >>= f = case mval of
    Error tr -> Error tr
    Content a -> f a

fmap2 :: (Monad m) => (a -> b -> c) -> (m a -> b -> m c)
fmap2 f ma b = fmap (`f` b) ma

raise :: (Monad m) => (a -> m b) -> (m a -> m b)
raise f ma = ma >>= f

raise2 :: (Monad m) => (a -> b -> m c) -> (m a -> b -> m c)
raise2 f ma b = ma >>= (`f` b)

raise2' :: (Monad m) => (a -> b -> m c) -> (a -> m b -> m c)
raise2' f a mb = mb >>= f a

readHandle :: (Read a) => String -> String -> Handle a
readHandle msg str = case readMaybe str of
  Nothing -> Error $ ("<Failed to read {{" ++ str ++ "}} as {{" ++ msg ++ "}}.>") :=> []
  Just a -> Content a

addTrace :: String -> Handle a -> Handle a
addTrace _ (Content a) = Content a
addTrace msg (Error tr) = Error (msg :=> [tr])

-- ┌───────────────────┐
-- │ INVERSE FUNCTIONS │
-- └───────────────────┘

mapHashingI :: (Shifting b) => (a -> b -> Handle Integer) -> (a -> Integer) -> ([a] -> [b] -> Handle Integer)
mapHashingI _ _ [] [] = Content 0
mapHashingI _ _ _ [] = Error $ "<A bug in the Matrix, calling `mapHashingI`.>" :=> []
mapHashingI _ _ [] _ = Error $ "<A bug in the Matrix, calling `mapHashingI`.>" :=> []
mapHashingI fI spr (a:as) (b:bs) =
  let curSpr = spr a
      restSpr = product $ map spr as
      curKeyH = fI a b
      restPreKeyH = mapHashingI fI spr as bs -- - shift b
   in case (curKeyH, restPreKeyH) of
        (Error tr1, Error (msg :=> [])) -> Error ("Double trace while mapping hash reversal:" :=> [tr1, msg :=> []])
        (Error tr1, Error (_ :=> trss)) -> Error ("Branching trace while mapping hash reversal:" :=> (tr1 : trss))
        (Error tr, _) -> Error ("Trace while mapping hash reversal:" :=> [tr])
        (_, Error tr) -> Error tr
        (Content curKey, Content nextPreKey) -> Content $ curKey + curSpr * mod (nextPreKey - shift b) restSpr

combineHashingI :: (a -> Integer -> b) -> (b -> c -> Handle Integer) -> (a -> c -> Integer -> Handle Integer)
combineHashingI f gI a c key1 = gI (f a key1) c

combineHashingI' :: (a -> b -> Handle Integer) -> (c -> Integer -> b) -> (a -> c -> Integer -> Handle Integer)
combineHashingI' fI gI' a c key2 = fI a (gI' c key2)

composeHashingI :: (Shifting b) => (a -> b -> Handle Integer) -> (a -> Integer) -> (b -> c -> Handle Integer) -> (b -> Integer) -> (a -> c -> b) -> (a -> c -> Handle Integer)
composeHashingI fI sprF gI sprG getB a c =
  let b = getB a c
      keyModH = fI a b
      nextKeyH = gI b c
   in case (keyModH, nextKeyH) of
        (Error tr1, Error tr2) -> Error ("Double trace while composing hashing reversal:" :=> [tr1, tr2])
        (Error tr, _) -> Error ("Trace while composing hashing reversal, in first function:" :=> [tr])
        (_, Error tr) -> Error ("Trace while composing hashing reversal, in second function:" :=> [tr])
        (Content keyMod, Content nextKey) -> Content $ keyMod + sprF a * mod (nextKey - shift b) (sprG b)

chooseOrderedI :: (Shifting a, Eq a, Show a) => ([a], Integer) -> [a] -> Handle Integer
chooseOrderedI (_,0) [] = Content 0
chooseOrderedI (src,num) hash
  | num /= length' hash = Error $
      "<Invalid hash: length should match source configuration.>" :=>
      [
        ("Reversing hash: {" ++ show hash ++ "} with length {" ++ show (length hash) ++ "}") :=> [],
        ("With source: {" ++ show (src,num) ++ "}") :=> []
      ]
chooseOrderedI (src, num) (a:as) =
  let srcLen = length' src
      keyModM = toInteger <$> elemIndex a src
      prevSpread = chooseOrderedSpread (srcLen-1, length' as)
      keyDivH = chooseOrderedI (filter (/= a) src, num-1) as
   in case keyModM of
        Nothing -> Error $
          ("<Invalid hash: element {{" ++ show a ++ "}} could not be found in source.>") :=>
          [
            ("Maybe the element {" ++ show a ++ "} is " ++ "{repeated}" ++ " in the hash,") :=> [],
            ("Or the hash " ++ "{is incompatible}" ++ " with the choice key?") :=> []
          ]
        Just keyMod -> case keyDivH of
          Error tr -> Error tr
          Content keyDiv -> Content $ keyMod + srcLen * mod (keyDiv - shift a) prevSpread
chooseOrderedI (_,_) _ = Error $ "<A bug in the Matrix, calling `chooseOrderedI`.>" :=> []

shuffleListI :: (Shifting a, Eq a, Show a) => [a] -> [a] -> Handle Integer
shuffleListI lst = chooseOrderedI (lst, length' lst)

shuffleListI' :: (Shifting a, Eq a) => [a] -> Integer -> [a]
shuffleListI' [] _ = []
shuffleListI' (r:rest) key =
  let nextLen = length' rest
      (keyDiv, keyMod) = divMod key (nextLen + 1)
      nextKey = keyDiv + shift r
   in insertAt r keyMod (shuffleListI' rest nextKey)

mergeTwoListsI :: (Shifting a, Eq a, Show a) => ([a], [a]) -> [a] -> Handle Integer
mergeTwoListsI ([], src) hash
  | src == hash = Content 0
  | otherwise = Error $
      "<Invalid hash: element mismatch.>" :=>
      [
        ("Reversing hash: {" ++ show hash ++ "}") :=> [],
        ("Using source: {" ++ show src ++ "}") :=> []
      ]
mergeTwoListsI (src, []) hash
  | src == hash = Content 0
  | otherwise = Error $
      "<Invalid hash: element mismatch.>" :=>
      [
        ("Reversing hash: {" ++ show hash ++ "}") :=> [],
        ("Using source: {" ++ show src ++ "}") :=> []
      ]
mergeTwoListsI (e1:rest1, e2:rest2) (m:ms)
  | m == e1 = case mergeTwoListsI (rest1, e2:rest2) ms of
      Error tr -> Error tr
      Content prevKey -> Content $ mod (prevKey - shift m) spr1
  | m == e2 = case mergeTwoListsI (e1:rest1, rest2) ms of
      Error tr -> Error tr
      Content prevKey -> Content $ spr1 + mod (prevKey - shift m) spr2
  | otherwise = Error $
      ("<Invalid hash: element {" ++ show m ++ "< does not match either source." ++ "}") :=>
      [
        ("Reversing hash: {" ++ show (m:ms) ++ "}") :=> [],
        ("First source list: {" ++ show (e1:rest1) ++ "}") :=> [],
        ("Second source list: {" ++ show (e2:rest2) ++ "}") :=> [],
        ("The head of the hash should be either {" ++ show e1 ++ "} or {" ++ show e2 ++ "}") :=> []
      ]
  where
    spr1 = mergeTwoListsSpread (length' rest1, 1 + length' rest2)
    spr2 = mergeTwoListsSpread (1 + length' rest1, length' rest2)
mergeTwoListsI (_, _) [] = Error $ "<Invalid hash: too few elements.>" :=> []

mergeListsI :: (Shifting a, Eq a, Show a) => [[a]] -> [a] -> Handle Integer
mergeListsI [] [] = Content 0
mergeListsI [] _  = Error $ "<A bug in the Matrix, calling `mergeListsI`.>" :=> []
mergeListsI [src] lst
  | lst == src = Content 0
  | otherwise = Error $
    "<Invalid hash: element mismatch.>" :=>
      [
        ("Reversing hash: {" ++ show lst ++ "}") :=> [],
        ("Current source: {" ++ show src ++ "}") :=> []
      ]
mergeListsI [l1, l2] res = mergeTwoListsI (l1,l2) res
mergeListsI (l:ls) res =
  let curSpr = mergeListsSpread' ls
      nextSpr = mergeTwoListsSpread (length' l, sum $ map length' ls)
      resWithoutL = filter (`notElem` l) res
      keyModH = mergeListsI ls resWithoutL
      nextKeyH = mergeTwoListsI (l, resWithoutL) res
   in case (keyModH, nextKeyH) of
        (Error tr1, Error tr2) -> Error ("Double trace while un-merging lists:" :=> [tr1, tr2])
        (_, Error tr) -> Error ("Trace while un-merging lists:" :=> [tr])
        (Error tr, _) -> Error ("Trace while un-merging lists:" :=> [tr])
        (Content keyMod, Content nextKey) -> Content $ keyMod + curSpr * mod (nextKey - shift l) nextSpr

distribute :: (Eq a) => [[a]] -> [[a]] -> a -> [[a]]
distribute [] _ _ = []
distribute _ [] _ = []
distribute (src:srcRest) (res:resRest) a
  | a `elem` src = (a:res) : resRest
  | otherwise = res : distribute srcRest resRest a

invertMergeLists :: (Eq a) => [[a]] -> [a] -> [[a]]
invertMergeLists srcs [] = [[] | _ <- srcs]
invertMergeLists srcs (a:as) = distribute srcs (invertMergeLists srcs as) a

chooseAndMergeI :: (Shifting a, Eq a, Show a) => [([a], Integer)] -> [a] -> Handle Integer
chooseAndMergeI = composeHashingI
  (mapHashingI chooseOrderedI chooseOrderedSpread')
  (product . map chooseOrderedSpread')
  mergeListsI
  mergeListsSpread'
  (invertMergeLists . map fst)

getHashI :: (Shifting a, Eq a, Show a) => [([a], Integer)] -> [a] -> Integer -> Handle Integer
getHashI = combineHashingI chooseAndMerge shuffleListI

getHashI' :: (Shifting a, Eq a, Show a) => [([a], Integer)] -> [a] -> Integer -> Handle Integer
getHashI' = combineHashingI' chooseAndMergeI shuffleListI'

-- ┌────────────────────┐
-- │ INVERSE VALIDATION │
-- └────────────────────┘

isInverseOnRange :: (a -> Integer -> b) -> (a -> b -> Integer) -> a -> [Integer] -> Integer -> IO ()
isInverseOnRange _ _ _ [] _ = putStrLn "| All tests passed. |"
isInverseOnRange f fI a (key:rest) lim =
  if key == fI a (f a key)
  then putStrLn (show key ++ ": Passed. " ++ show (lim - 1) ++ " left.") >> isInverseOnRange f fI a rest (lim - 1)
  else do
    putStrLn ("| Failed on number " ++ show key ++ " with:")
    putStrLn ("|   key = " ++ show key)
    putStrLn ("|   output = " ++ show (fI a (f a key)))

isInverseOnRange2 :: (a -> Integer -> Integer -> b) -> (a -> b -> Integer -> Integer) -> a -> Integer -> [Integer] -> Integer -> IO ()
isInverseOnRange2 f2 f2I a key1 key2s lim =
  let f a' = f2 a' key1
      fI a' b = f2I a' b key1
   in isInverseOnRange f fI a key2s lim

isInverseOnRange2' :: (a -> Integer -> Integer -> b) -> (a -> b -> Integer -> Integer) -> a -> Integer -> [Integer] -> Integer -> IO ()
isInverseOnRange2' f2 f2I a key2 key1s lim =
  let f a' key1 = f2 a' key1 key2
      fI a' b = f2I a' b key2
   in isInverseOnRange f fI a key1s lim

isInverse :: (a -> Integer -> b) -> (a -> Integer) -> (a -> b -> Integer) -> a -> IO ()
isInverse f sprF fI a = isInverseOnRange f fI a [0 .. sprF a - 1] (sprF a)

isInverse2 :: (a -> Integer -> Integer -> b) -> (a -> Integer) -> (a -> b -> Integer -> Integer) -> a -> Integer -> IO ()
isInverse2 f2 sprF f2I a key1 = isInverseOnRange2 f2 f2I a key1 [0 .. sprF a - 1] (sprF a)

isInverse2' :: (a -> Integer -> Integer -> b) -> (a -> Integer) -> (a -> b -> Integer -> Integer) -> a -> Integer -> IO ()
isInverse2' f2 sprF f2I a key2 = isInverseOnRange2' f2 f2I a key2 [0 .. sprF a - 1] (sprF a)

-- ┌─────────────────────────────────────────────────────┐
-- │ PRE-DEFINED STRINGS FROM WHICH HASHES WILL BE DRAWN │
-- └─────────────────────────────────────────────────────┘

sourceLower :: [Char]
sourceLower = "ckapzfitqdxnwehrolmbyvsujg"

sourceUpper :: [Char]
sourceUpper = "RQLIANBKJYVWPTEMCZSFDOGUHX"

sourceSpecial :: [Char]
sourceSpecial = "=!*@?$%#&-+^"

sourceNumbers :: [Char]
sourceNumbers = "1952074386"

defaultConfiguration :: [([Char], Integer)]
defaultConfiguration = [(sourceLower, 8), (sourceUpper, 8), (sourceSpecial, 5), (sourceNumbers, 4)]

mediumConfiguration :: [([Char], Integer)]
mediumConfiguration = [(sourceLower, 5), (sourceUpper, 5), (sourceSpecial, 5), (sourceNumbers, 5)]

shortConfiguration :: [([Char], Integer)]
shortConfiguration = [(sourceLower, 4), (sourceUpper, 4), (sourceSpecial, 4), (sourceNumbers, 4)]

anlongConfiguration :: [([Char], Integer)]
anlongConfiguration = [(sourceLower, 7), (sourceUpper, 7), (sourceNumbers, 7)]

anshortConfiguration :: [([Char], Integer)]
anshortConfiguration = [(sourceLower, 4), (sourceUpper, 4), (sourceNumbers, 4)]

pinCodeConfiguration :: [([Char], Integer)]
pinCodeConfiguration = [(sourceNumbers, 4)]

mediumPinCodeConfiguration :: [([Char], Integer)]
mediumPinCodeConfiguration = [(sourceNumbers, 6)]

longPinCodeConfiguration :: [([Char], Integer)]
longPinCodeConfiguration = [(sourceNumbers, 8)]

defaultConfigFiles :: [String]
defaultConfigFiles =
  [
    "./pshash.conf",
    "~/.config/pshash/pshash.conf",
    "~/.pshash.conf",
    "/etc/pshash/pshash.conf",
    "C:\\pshash.conf"
  ]

-- ┌──────────────────┐
-- │ COUNTING NUMBERS │
-- └──────────────────┘

numberOfHashes :: [(Integer, Integer)] -> Integer
numberOfHashes amts = product (zipWith cnk fsts snds) * factorial (sum snds)
  where
    fsts = map fst amts
    snds = map snd amts

numberOfHashes' :: [([Char], Integer)] -> Integer
numberOfHashes' = numberOfHashes . map dropElementInfo

numberOfChoiceKeys :: [(Integer, Integer)] -> Integer
numberOfChoiceKeys = chooseAndMergeSpread

numberOfChoiceKeys' :: [([a], Integer)] -> Integer
numberOfChoiceKeys' = chooseAndMergeSpread'

numberOfShuffleKeys :: [Integer] -> Integer
numberOfShuffleKeys = factorial . sum

numberOfShuffleKeys' :: [([a], Integer)] -> Integer
numberOfShuffleKeys' = numberOfShuffleKeys . map snd

numberOfRepetitions :: [Integer] -> Integer
numberOfRepetitions = numberOfShuffleKeys

numberOfPublicKeys :: [(Integer, Integer)] -> Integer
numberOfPublicKeys = numberOfChoiceKeys

numberOfPublicKeys' :: [([a], Integer)] -> Integer
numberOfPublicKeys' = numberOfChoiceKeys'

maxLengthOfPublicKey :: [(Integer, Integer)] -> Integer
maxLengthOfPublicKey amts = getBiggestPower 0 $ (length' . show) (numberOfPublicKeys amts)
  where
    get128PowerLength :: Integer -> Integer
    get128PowerLength p = 2 * p + 3 * pDiv + npMod where
      (pDiv, pMod) = divMod p 28
      npMod
        | pMod < 10 = 1
        | pMod < 19 = 2
        | otherwise = 3
    getBiggestPower :: Integer -> Integer -> Integer
    getBiggestPower guess bound
      | get128PowerLength (guess + 1) < bound = getBiggestPower (guess + 1) bound
      | otherwise = guess + 1

timeToChechPicos :: Double
timeToChechPicos = 100.0

psInYear :: Double
psInYear = 3.15576E19

ageOfUniverseYears :: Double
ageOfUniverseYears = 13.787E9

timeToCrack :: Integer -> (Double, Double)
timeToCrack num = (inYears, inAgesOfUniverse)
  where
    inYears = (timeToChechPicos / psInYear) * fromIntegral num
    inAgesOfUniverse = inYears / ageOfUniverseYears

formatInteger :: String -> String
formatInteger num = reverse $ formatReversed (reverse num)
  where
    formatReversed :: String -> String
    formatReversed (a : b : c : d : str) = a : b : c : ',' : formatReversed (d : str)
    formatReversed str = str

formatDouble :: String -> Int -> String
formatDouble "" _ = ""
formatDouble ('e':'-':rest) _ = " * 10^(-" ++ rest ++ ")"
formatDouble ('e':rest) _ = " * 10^" ++ rest
formatDouble (digit:rest) places
  | places == 0 = formatDouble rest places
  | otherwise = digit : formatDouble rest (places-1)

numberOfPlaces :: Int
numberOfPlaces = 4

-- ┌──────────────┐
-- │ READING KEYS │
-- └──────────────┘

getPublicKey' :: String -> Integer
getPublicKey' "" = 0
getPublicKey' (c:cs) = toInteger (ord c) + 128 * getPublicKey' cs

getPublicKey :: String -> Integer
getPublicKey = getPublicKey' . reverse

getPublicStr' :: Integer -> String
getPublicStr' 0 = ""
getPublicStr' key = chr (fromInteger (mod key 128)) : getPublicStr' (div key 128)

getPublicStr :: Integer -> String
getPublicStr = reverse . getPublicStr'

getPrivateKey :: String -> Handle Integer
getPrivateKey s = liftA2 (^) base pow where
  (baseStr, powStr) = break' '-' s
  base :: Handle Integer
  base = readHandle "base in private key" baseStr
  pow :: Handle Integer
  pow = if null powStr then Content 1 else case readHandle "exponent in private key" powStr of
    Error tr -> Error tr
    Content n ->
      if n < 0
      then Error $ ("<Cannot have negative exponent in private key: {{" ++ powStr ++ "}}.>") :=> []
      else Content n

-- ┌─────────────────────┐
-- │ FINAL HASH FUNCTION │
-- └─────────────────────┘

getFinalHash :: [([Char], Integer)] -> String -> String -> String -> Handle [Char]
getFinalHash config publicStr choiceStr shuffleStr =
  liftH2
    ("Trace while computing hash, getting the " ++ "{choice}" ++ " key:")
    ("Trace while computing hash, getting the " ++ "{shuffle}" ++ " key:")
    (getHash config) choiceKey shuffleKey
  where
    publicKey = getPublicKey publicStr
    choiceKey = liftA2 mod ((+publicKey) <$> getPrivateKey choiceStr) $ return (chooseAndMergeSpread' config)
    shuffleKey = getPrivateKey shuffleStr

-- ┌─────────────────┐
-- │ QUERY FUNCTIONS │
-- └─────────────────┘

checkConfigValidity :: [([Char], Integer)] -> Handle [([Char], Integer)]
checkConfigValidity [] = Error $ "<Cannot have empty configuration.>" :=> []
checkConfigValidity [(lst, num)]
  | num < 0 = Error $ ("<Invalid configuration: number {{" ++ show num ++ "}} must be non-negative.>") :=> []
  | num > length' lst = Error $ "<Invalid configuration: too many elements drawn.>" :=>
      [
        ("Using source: {" ++ show lst ++ "}") :=> [],
        ("Available amount: {" ++ show (length lst) ++ "}") :=> [],
        ("Demanded: {" ++ show num ++ "}") :=> []
      ]
  | otherwise = Content [(lst, num)]
checkConfigValidity (src : rest) = case checkConfigValidity [src] of
  Error tr -> Error tr
  Content src' -> (src' ++) <$> checkConfigValidity rest

getConfigFromSpec :: (Integer, Integer, Integer, Integer) -> [([Char], Integer)]
getConfigFromSpec (a,b,c,d) = [(sourceLower, a), (sourceUpper, b), (sourceSpecial, c), (sourceNumbers, d)]

retrievePublicKey :: [([Char], Integer)] -> String -> String -> [Char] -> Handle String
retrievePublicKey config choiceStr shuffleStr hashStr =
  let shuffleKey = getPrivateKey shuffleStr
      preChoiceKey = getPrivateKey choiceStr
      choiceKey = shuffleKey >>= getHashI' config hashStr
   in addTrace "Trace while retrieving public key:" $
      getPublicStr <$> fmap2 mod (liftA2 (-) choiceKey preChoiceKey) (numberOfPublicKeys' config)

retrieveChoiceKey :: [([Char], Integer)] -> String -> String -> [Char] -> Handle Integer
retrieveChoiceKey config publicStr shuffleStr hashStr =
  let publicKey = getPublicKey publicStr
      shuffleKey = getPrivateKey shuffleStr
      preChoiceKey = shuffleKey >>= getHashI' config hashStr
      choiceMergeSpr = chooseAndMergeSpread' config
   in addTrace "Trace while retrieving choice key:" $
      fmap2 mod (fmap2 (-) preChoiceKey publicKey) choiceMergeSpr

retrieveShuffleKey :: [([Char], Integer)] -> String -> String -> [Char] -> Handle Integer
retrieveShuffleKey config publicStr choiceStr hashStr =
  let publicKey = getPublicKey publicStr
      preChoiceKey = getPrivateKey choiceStr
      choiceKey = fmap2 mod (fmap (+ publicKey) preChoiceKey) (numberOfChoiceKeys' config)
      preHash = fmap (chooseAndMerge config) choiceKey
   in addTrace "Trace while retrieving shuffle key:" $
      raise2 shuffleListI preHash hashStr

-- ┌────────────────┐
-- │ USER INTERFACE │
-- └────────────────┘

data OptionName = KEYWORD | SELECT | CONFIG | INFO | QUERY | CONFIGFILE | PATCH | PURE | LIST | NOPROMPTS | SHOW | REPEAT | HELP | VERSION | FIRST | SECOND | THIRD | E1 | E2 | E3 | P1 | P2 | P3
  deriving (Eq, Ord, Show)

handleWith :: (a -> IO ()) -> Handle a -> IO (Handle ())
handleWith f ma = case ma of
  Error tr -> return (Error tr)
  Content a -> f a >> return (Content ())

infoAction :: [([Char], Integer)] -> String -> IO (Handle ())
infoAction config "help" = do
      let show' :: [([Char],Integer)] -> String
          show' config' = "[\n" ++ concatMap (("  " ++) . (++ "\n") . show) config' ++ "]"
      putStrLn . unlines $
          "usage: pshash [ --help | --version | --list | --pure ]"
        : "              [ +color | +no-color ]"
        : "              [ -d|n|c|i|q|f|p ARGUMENT ]"
        : "              [ PUBLIC CHOICE SHUFFLE ]"
        : ""
        : "options:"
        : "  --help              Show this help message and exit"
        : ""
        : "  --version           Print the current version of pshash"
        : ""
        : "  --list              Print the list of (choice,shuffle) pairs that would"
        : "                      produce the given hash. Accepts three arguments:"
        : "                       - the PUBLIC key,"
        : "                       - the NUMBER of pairs to compute, and"
        : "                       - the final HASH."
        : ""
        : "  --pure              Ignore all configuration files."
        : ""
        : "  --no-prompts        Omit prompts."
        : ""
        : "  --repeat            Ask the user to repeat keys."
        : ""
        : "  --show              Do not conceal typed keys."
        : ""
        : "  +color              Enable colors in error messages."
        : ""
        : "  +no-color           Disable colors in error messages."
        : ""
        : "                      (options starting with '+' are low-level, they are"
        : "                      parsed at the very end of the execution chain)"
        : ""
        : "  -d KEYWORD          Specify the source configuration. KEYWORD can be"
        : "                      one of the following (default is long):"
        : "                       - long (8 upper, 8 lower, 5 special, 4 digits)"
        : "                       - medium (5 symbols of each type above)"
        : "                       - short (4 symbols of each type)"
        : "                       - anlong (7 upper case, 7 lower case, 7 digits)"
        : "                       - anshort (4 upper case, 4 lower case, 4 digits)"
        : "                       - pin (4-digit pin code)"
        : "                       - mediumpin (6-digit pin code)"
        : "                       - longpin (8-digit pin code)"
        : ""
        : "  -n \"(L, U, S, D)\"   Specify how many Lower case, Upper case,"
        : "                      Special characters, and Digits should be used"
        : ""
        : "  -c CONFIGURATION    Specify the source configuration manually,"
        : "                      as Haskell [([Char], Integer)] type"
        : ""
        : "  -i KEYWORD          Show meta information. KEYWORD can be one of:"
        : "                       - help (same as `--help`)"
        : "                       - version (same as `--version`)"
        : "                       - numbers (show the total amounts of hashes/keys)"
        : "                       - times (show times needed to crack your passwords)"
        : ""
        : "  -q KEYWORD          Retrieve one of the keys from a final hash and"
        : "                      two remaining keys. KEYWORD can be one of:"
        : "                       - public (followed by CHOICE SHUFFLE HASH as keys)"
        : "                       - choice (followed by PUBLIC SHUFFLE HASH as keys)"
        : "                       - shuffle (followed by PUBLIC CHOICE HASH as keys)"
        : ""
        : "  -f PATH             Read the configuration file from PATH. If neither"
        : "                      this nor the `--pure` option is used, the program"
        : "                      will try to read from the following files:"
        : map ("                       - " ++) defaultConfigFiles ++
          "                      Each line of the file should follow the format"
        : "                         PUBLIC: ARGS"
        : "                      (other lines will be ignored)"
        : "                      A line with the keyword \"+all\" as PUBLIC will apply"
        : "                      to all public keys."
        : "                      When using configuration files, the PUBLIC key needs"
        : "                      to be specified inline as a command line argument."
        : "                      The program will match it with one of the entries in"
        : "                      the file and use the corresponding ARGS."
        : ""
        : "  -p SHIFT            Shift all characters in the public key by the"
        : "                      specified amount. This option is generally discouraged,"
        : "                      but sometimes necessary to create multiple passwords"
        : "                      with one set of keys"
        : ""
        : "main arguments:"
        : "  PUBLIC              Stands for public key, a memorable string indicative"
        : "                      of the password destination (e.g. \"google\", \"steam\")"
        : ""
        : "  CHOICE              Stands for choice private key, a large number"
        : ("                      between 0 and " ++ formatDouble (show (fromIntegral (numberOfChoiceKeys' config) :: Double)) numberOfPlaces)
        : ""
        : "  SHUFFLE             Stands for shuffle private key, a number"
        : ("                      between 0 and " ++ formatDouble (show (fromIntegral (numberOfShuffleKeys $ map snd config) :: Double)) numberOfPlaces)
        : ""
        : "using source configuration:"
        : show' config
        : []
      return (Content ())
infoAction _ "version" = putStrLn ("The pshash pseudo-hash password manager, version " ++ currentVersion) >> return (Content ())
infoAction config "numbers" =
  let amts = map dropElementInfo config
      numHashes = numberOfHashes amts
      numHashesDouble = fromIntegral numHashes :: Double
      numChoice = numberOfChoiceKeys amts
      numChoiceDouble = fromIntegral numChoice :: Double
      numShuffle = numberOfShuffleKeys $ map snd amts
      numShuffleDouble = fromIntegral numShuffle :: Double
      numRepetitions = numberOfRepetitions $ map snd amts
      numRepetitionsDouble = fromIntegral numRepetitions :: Double
   in do
  putStrLn $ "using the following configuration distribution: " ++ show amts
  putStrLn ""
  putStrLn $
    "total theoretical number of hashes:         "
      ++ formatInteger (show numHashes) ++ " ("
      ++ formatDouble (show numHashesDouble) numberOfPlaces ++ ")"
  putStrLn $
    "number of choice keys:                      "
      ++ formatInteger (show numChoice) ++ " ("
      ++ formatDouble (show numChoiceDouble) numberOfPlaces ++ ")"
  putStrLn $
    "number of shuffle keys:                     "
      ++ formatInteger (show numShuffle) ++ " ("
      ++ formatDouble (show numShuffleDouble) numberOfPlaces ++ ")"
  putStrLn $
    "number of key pairs with the same hash:     "
      ++ formatInteger (show numRepetitions) ++ " ("
      ++ formatDouble (show numRepetitionsDouble) numberOfPlaces ++ ")"
  putStrLn $ "total hash length:                          " ++ show ((sum . map snd) amts) ++ " symbols"
  putStrLn $ "maximum relevant length of the public key:  " ++ show (maxLengthOfPublicKey amts) ++ " symbols"
  return (Content ())
infoAction config "times" = let amts = map dropElementInfo config in do
  putStrLn $ "using the following configuration distribution: " ++ show amts
  putStrLn $ "assumed number of password checks per second:   " ++ "10 billion = 10^10"
  putStrLn $ "time to check one password:                     " ++ "10^(-10) s = 0.1 nanosecond"
  putStrLn ""
  putStrLn $
    let (inY, inAoU) = timeToCrack $ numberOfHashes amts
        inAoUInteger = floor inAoU :: Integer
        inYInteger = floor inY :: Integer
     in "time to brute-force your password:              "
          ++ formatInteger (show inYInteger) ++ " ("
          ++ formatDouble (show inY) numberOfPlaces ++ ") years\n"
          ++ "                                             or "
          ++ formatInteger (show inAoUInteger) ++ " ("
          ++ formatDouble (show inAoU) numberOfPlaces
          ++ ") ages of the Universe"
  putStrLn ""
  putStrLn $
    let (inY, inAoU) = timeToCrack $ numberOfRepetitions $ map snd amts
        inAoUInteger = floor inAoU :: Integer
        inYInteger = floor inY :: Integer
     in "time to retrieve the keys based on a hash:      "
          ++ formatInteger (show inYInteger) ++ " ("
          ++ formatDouble (show inY) numberOfPlaces ++ ") years\n"
          ++ "                                             or "
          ++ formatInteger (show inAoUInteger) ++ " ("
          ++ formatDouble (show inAoU) numberOfPlaces
          ++ ") ages of the Universe"
  return (Content ())
infoAction _ cmd = return . Error $ ("Info command not recognized: " ++ cmd ++ ".") :=> []

queryAction :: [([Char], Integer)] -> String -> [Char] -> String -> String -> IO (Handle ())
queryAction config "public" choiceStr shuffleStr hashStr = handleWith print $ retrievePublicKey config choiceStr shuffleStr hashStr
queryAction config "choice" publicStr shuffleStr hashStr = handleWith print $ retrieveChoiceKey config publicStr shuffleStr hashStr
queryAction config "shuffle" publicStr choiceStr hashStr = handleWith print $ retrieveShuffleKey config publicStr choiceStr hashStr
queryAction _ kw _ _ _ = return . Error $ ("<Query keyword not recognized: {{" ++ kw ++ "}}.>") :=> []

listPairsAction :: [([Char], Integer)] -> String -> String -> [Char] -> IO (Handle ())
listPairsAction config publicStr limitStr hashStr =
  let publicKey = getPublicKey publicStr
      mlimit = readHandle "integer" limitStr :: Handle Integer
      format :: Integer -> Integer -> String
      format shuffleKey preChoiceKey = show (mod (preChoiceKey - publicKey) (numberOfChoiceKeys' config)) ++ " " ++ show shuffleKey
      getPair :: Integer -> Handle String
      getPair shuffleKey = fmap (format shuffleKey) (getHashI' config hashStr shuffleKey)
      sequence' :: [IO (Handle ())] -> IO (Handle ())
      sequence' [] = return (Content ())
      sequence' (io : rest) = do
        res <- io
        case res of
          Error tr -> return (Error tr)
          Content () -> sequence' rest
   in case mlimit of
        Error tr -> return (Error $ "Trace while reading number of pairs to print:" :=> [tr])
        Content limit -> sequence' $ take' limit $ map (handleWith putStrLn  . getPair) [0 .. numberOfShuffleKeys' config - 1]

hashAction :: [([Char], Integer)] -> String -> String -> String -> IO (Handle ())
hashAction config publicStr choiceStr shuffleStr = handleWith putStrLn $ getFinalHash config publicStr choiceStr shuffleStr

safeReadWithHandler :: (Monad m) => (IOException -> IO (m String)) -> FilePath -> IO (m String)
safeReadWithHandler handler path = (return <$> readFile path) `catch` handler

readFileMaybe :: FilePath -> IO (Maybe String)
readFileMaybe = safeReadWithHandler (const $ return Nothing)

readFileHandle :: FilePath -> IO (Handle String)
readFileHandle = safeReadWithHandler handler
  where handler e = return . Error $ "<Error reading configuration file:>" :=> [ show e :=> [] ]

getConfigFromContents :: Maybe String -> String -> IO (Handle [([Char], Integer)])
getConfigFromContents publicStrM contents = process specs
  where
    specLines = filter (elem ':') (lines contents)
    specs = map (break' ':') specLines
    process :: [(String, String)] -> IO (Handle [([Char], Integer)])
    process [] = return (Content defaultConfiguration)
    process ((publicStr', argStr) : rest) = case publicStrM of
      Nothing -> return . Error $ "<Cannot use configuration file: public key was not pre-supplied. Either:>" :=>
        [
          ("Disable configuration files by passing the " ++ "{--pure}" ++ " option, or") :=> [],
          ("{Pass the public key inline}" ++ " as one of the arguments, or") :=> [],
          ("{Remove}" ++ " the configuration files.") :=> []
        ]
      Just publicStr ->
        if publicStr == publicStr' || publicStr' == "+all"
        then case parseArgs' (True, True, True) (words argStr) of
          Error tr -> return . Error $ ("Trace while parsing options for {" ++ publicStr' ++ "}:") :=> [tr]
          Content args -> getConfig (insertWith const PURE "" args)
        else process rest

getConfig :: Map OptionName String -> IO (Handle [([Char], Integer)])
getConfig args
  | member KEYWORD args = return $ case args ! KEYWORD of
      "long" -> Content defaultConfiguration
      "medium" -> Content mediumConfiguration
      "short" -> Content shortConfiguration
      "anlong" -> Content anlongConfiguration
      "anshort" -> Content anshortConfiguration
      "pin" -> Content pinCodeConfiguration
      "mediumpin" -> Content mediumPinCodeConfiguration
      "longpin" -> Content longPinCodeConfiguration
      str -> Error $ ("<Unrecognized configuration keyword: {{" ++ str ++ "}}.>") :=> []
  | member SELECT args =
      return $ readHandle "(Int,Int,Int,Int)" (args ! SELECT)
      >>= (checkConfigValidity . getConfigFromSpec)
  | member CONFIG args =
      return $ readHandle "source configuration" (args ! CONFIG)
      >>= checkConfigValidity
  | any (`member` args) [PURE, INFO, QUERY, LIST] = return (Content defaultConfiguration)
  | member CONFIGFILE args = do
      fileContentsH <- readFileHandle (args ! CONFIGFILE)
      case fileContentsH of
        Error tr -> return (Error $ ("Trace while reading contents from {" ++ args ! CONFIGFILE ++ "}:") :=> [tr])
        Content contents -> getConfigFromContents (DM.lookup FIRST args) contents
  | otherwise = do
      let replaceChar :: Char -> String -> String -> String
          replaceChar _ _ "" = ""
          replaceChar old new (ch : rest)
            | ch == old = new ++ replaceChar old new rest
            | otherwise = ch : replaceChar old new rest
      homeDir <- getHomeDirectory
      fileContentsM <- mapM (readFileMaybe . replaceChar '~' homeDir) defaultConfigFiles
      let findContents :: [Maybe String] -> IO (Handle [([Char], Integer)])
          findContents [] = return (Content defaultConfiguration)
          findContents (Nothing : rest) = findContents rest
          findContents (Just contents : _) = getConfigFromContents (DM.lookup FIRST args) contents
      findContents fileContentsM

insert' :: (Ord k) => k -> a -> Map k a -> Map k a
insert' = insertWith (const id)

parseArgs :: (Bool, Bool, Bool) -> [String] -> Handle (Map OptionName String)
parseArgs _ [] = Content empty
parseArgs trp (('+':_) : rest) = parseArgs trp rest
parseArgs trp (['-', opt] : s : rest) = case opt of
  'd' -> insert' KEYWORD s <$> parseArgs trp rest
  'n' -> insert' SELECT s <$> parseArgs trp rest
  'c' -> insert' CONFIG s <$> parseArgs trp rest
  'i' -> insert' INFO s <$> parseArgs trp rest
  'q' -> insert' QUERY s <$> parseArgs trp rest
  'f' -> insert' CONFIGFILE s <$> parseArgs trp rest
  'p' -> insert' PATCH s <$> parseArgs trp rest
  ch -> Error $ ("<Unsupported option: {{" ++ ['-',ch] ++ "}}.>") :=> []
parseArgs _ [['-', _]] = Error $ "<All short options require arguments. Use {{--help}} for details.>" :=> []
parseArgs trp (('-':'-':opt) : rest) = case opt of
  "pure" -> insert' PURE "" <$> parseArgs trp rest
  "list" -> insert' LIST "" <$> parseArgs trp rest
  "no-prompts" -> insert' NOPROMPTS "" <$> parseArgs trp rest
  "repeat" -> insert' REPEAT "" <$> parseArgs trp rest
  "show" -> insert' SHOW "" <$> parseArgs trp rest
  "help" -> insert' INFO "help" <$> parseArgs trp rest
  "version" -> insert' INFO "version" <$> parseArgs trp rest
  str -> Error $ ("<Unsupported option: {{--" ++ str ++ "}}.>") :=> []
parseArgs _ (['-'] : _) = Error $ "<All dashes should be followed by command line options.>" :=> []
parseArgs _ (('-':ch:opt) : _) = Error $ "<Violation of command line option format. Try:>" :=>
  [
    ("{" ++ ('-':'-':ch:opt) ++ "} for long option, or") :=> [],
    ("{" ++ ['-',ch] ++ "} for short option.") :=> []
  ]
parseArgs (b1, b2, b3) (s : rest)
  | b3 = Error $ ("<Excessive argument: {{" ++ s ++ "}}. All three keys were already provided.>") :=> []
  | b2 = insert' THIRD s <$> parseArgs (True, True, True) rest
  | b1 = insert' SECOND s <$> parseArgs (True, True, False) rest
  | otherwise = insert' FIRST s <$> parseArgs (True, False, False) rest

parseArgs' :: (Bool, Bool, Bool) -> [String] -> Handle (Map OptionName String)
parseArgs' trp = addTrace "Trace while parsing arguments:" . raise patchFirstArg . parseArgs trp

patchFirstArg :: Map OptionName String -> Handle (Map OptionName String)
patchFirstArg args
  | member PATCH args =
    if member FIRST args
    then do
      patchAmount <- (readHandle "integer" (args ! PATCH) :: Handle Integer)
      Content $ insertWith const FIRST (map (chr . fromInteger . (`mod` 128) . (+ patchAmount) . toInteger . ord) (args ! FIRST)) args
    else Error $ "<Cannot patch public key that was not pre-supplied. Either:>" :=>
      [
        ("{Pass the public key inline}" ++ " as one of the arguments, or") :=> [],
        ("{Remove}" ++ " the " ++ "{-p}" ++ " option.") :=> []
      ]
  | otherwise = Content args

withEcho :: Bool -> IO a -> IO a
withEcho echo action = do
  old <- hGetEcho stdin
  bracket_ (hSetEcho stdin echo) (hSetEcho stdin old) action

getInput :: Bool -> Bool -> String -> IO String
getInput echo repeat prompt = do
  unless (null prompt) $ hPutStr stderr prompt
  input <- withEcho echo getLine
  unless echo $ hPutChar stderr '\n'
  if not echo && repeat then do
    unless (null prompt) $ hPutStr stderr ("(repeat)" ++ replicate (length prompt - 10) ' ' ++ ": ")
    inputRepeat <- withEcho echo getLine
    hPutChar stderr '\n'
    if input == inputRepeat then return input
    else do
      hPutStrLn stderr "Keys do not match. Try again."
      getInput echo repeat prompt
  else return input

getKeyStr :: Map OptionName String -> OptionName -> OptionName -> OptionName -> IO String
getKeyStr args opt echoOpt promptOpt
  | member opt args = return $ args ! opt
  | otherwise = getInput (member echoOpt args) (member REPEAT args) (args ! promptOpt)

passKeysToAction ::
  Map OptionName String ->
  (String -> String -> String -> IO (Handle ())) ->
  IO (Handle ())
passKeysToAction args act = do
  first <- getKeyStr args FIRST E1 P1
  second <- getKeyStr args SECOND E2 P2
  third <- getKeyStr args THIRD E3 P3
  act first second third

removeCodesInString :: Bool -> String -> String
removeCodesInString _ [] = []
removeCodesInString False ('m':rest) = removeCodesInString True rest
removeCodesInString False (_:rest) = removeCodesInString False rest
removeCodesInString True ('\ESC':rest) = removeCodesInString False rest
removeCodesInString True (c:rest) = c : removeCodesInString True rest

removeCodes :: Trace -> Trace
removeCodes (msg :=> trs) = removeCodesInString True msg :=> map removeCodes trs

setEchoesAndPrompts :: Map OptionName String -> Map OptionName String
setEchoesAndPrompts args
  | member INFO args = args
  | member QUERY args =
      insert' E1 "" $ insert' E2 "" $ insert' E3 "" $
        if member NOPROMPTS args
        then insert' P1 "" $ insert' P2 "" $ insert' P3 "" args
        else case args ! QUERY of
            "public" -> insert' P1 "CHOICE KEY: " . insert' P2 "SHUFFLE KEY: "
            "choice" -> insert' P1 "PUBLIC KEY: " . insert' P2 "SHUFFLE KEY: "
            "shuffle" -> insert' P1 "PUBLIC KEY: " . insert' P2 "CHOICE KEY: "
            _ -> insert' P1 "INPUT: " . insert' P2 "INPUT: "
          $ insert' P3 "FINAL HASH: " args
  | member LIST args =
      insert' E1 "" $ insert' E2 "" $ insert' E3 "" $
      if member NOPROMPTS args
      then insert' P1 "" $ insert' P2 "" $ insert' P3 "" args
      else insert' P1 "PUBLIC KEY: " $ insert' P2 "NUMBER OF PAIRS: " $ insert' P3 "FINAL HASH: " args
  | otherwise =
      insert' E1 "" $ (if member SHOW args then insert' E2 "" . insert' E3 "" else id) $
      if member NOPROMPTS args
      then insert' P1 "" $ insert' P2 "" $ insert' P3 "" args
      else insert' P1 "PUBLIC KEY: " $ insert' P2 "CHOICE KEY: " $ insert' P3 "SHUFFLE KEY: " args

-- ((False, "Public key: "), (False, "Number of pairs: "), (False, "Final hash: "))
performAction :: Map OptionName String -> Handle [([Char], Integer)] -> IO (Handle ())
performAction _ (Error tr) = return (Error $ "Trace in configuration argument:" :=> [tr])
performAction args (Content config)
  | member INFO args = infoAction config (args ! INFO)
  | member QUERY args = passKeysToAction args (queryAction config (args ! QUERY))
  | member LIST args = passKeysToAction args (listPairsAction config)
  | otherwise = passKeysToAction args (hashAction config)

printTraceList :: [Bool] -> [Trace] -> IO ()
printTraceList _ [] = return ()
printTraceList places [tr] = printTrace places [False,False] tr
printTraceList places (tr:rest) = printTrace places [True, False] tr >> printTraceList places rest

printTrace :: [Bool] -> [Bool] -> Trace -> IO ()
printTrace places pass (msg :=> lst) = do
  let prefix = map (\b -> if b then '|' else ' ') places ++ "|_"
  hPutStrLn stderr $ prefix ++ msg
  printTraceList (places ++ pass) lst

formatWithColor :: String -> String
formatWithColor [] = []
formatWithColor ('<':rest) = "\ESC[31m" ++ formatWithColor rest
formatWithColor ('>':rest) = "\ESC[0m" ++ formatWithColor rest
formatWithColor ('{':'{':rest) = "\ESC[33m" ++ formatWithColor rest
formatWithColor ('}':'}':rest) = "\ESC[31m" ++ formatWithColor rest
formatWithColor ('{':rest) = "\ESC[33m" ++ formatWithColor rest
formatWithColor ('}':rest) = "\ESC[0m" ++ formatWithColor rest
formatWithColor (c:rest) = c : formatWithColor rest

formatWithoutColor :: String -> Bool -> String
formatWithoutColor [] _ = []
formatWithoutColor ('<':rest) _ = formatWithoutColor rest True
formatWithoutColor ('>':rest) _ = formatWithoutColor rest False
formatWithoutColor ('{':'{':rest) _ = '*' : formatWithoutColor rest False
formatWithoutColor ('}':'}':rest) _ = '*' : formatWithoutColor rest True
formatWithoutColor ('{':rest) upper = '*' : formatWithoutColor rest upper
formatWithoutColor ('}':rest) upper = '*' : formatWithoutColor rest upper
formatWithoutColor (c:rest) True = toUpper c : formatWithoutColor rest True
formatWithoutColor (c:rest) False = c : formatWithoutColor rest False

formatTrace :: Bool -> Trace -> Trace
formatTrace True (msg :=> trs) = formatWithColor msg :=> map (formatTrace True) trs
formatTrace False (msg :=> trs) = formatWithoutColor msg False :=> map (formatTrace False) trs

toIO :: [String] -> IO (Handle ()) -> IO ()
toIO rawArgs action = do
  let color
        | "+no-color" `elem` rawArgs = False
        | "+color" `elem` rawArgs = True
        | os == "linux" || os == "linux-android" = True
        | otherwise = False
      errorWord = if color then "\ESC[1;31mError:\ESC[0m" else "ERROR:"
  res <- action
  case res of
    Error tr -> do
      hPutStrLn stderr errorWord
      printTrace [] [False,False] (formatTrace color tr)
      exitWith (ExitFailure 1)
    Content () -> return ()

main :: IO ()
main = getArgs >>= toIO <*> (raiseH' (raise2' performAction <*> getConfig) . fmap setEchoesAndPrompts . parseArgs' (False, False, False))
