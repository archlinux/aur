# Didact Gothic — τι μπορεί να κάνει η γραμματοσειρά

Ελέγχθηκε το `DidactGothic-Regular.ttf` του google/fonts (`ofl/didactgothic`),
commit `c741144416d5635d5de832dff8ba09292c112036` (έκδοση 2.101, 1000 upem).
Σχεδιαστές: Daniel Johnson, Cyreal.

## Δομή

| | |
|---|---|
| Άξονες | κανένας (static, μόνο Regular, usWeightClass 400) |
| Πλάγια | δεν υπάρχουν (το πλάγιο που βλέπεις είναι ψεύτικο slant του συστήματος) |
| Glyphs | 1272 |
| Πίνακες | GDEF GPOS GSUB DSIG cvt fpgm prep gasp glyf… Χωρίς `kern` πίνακα (το kerning είναι GPOS), `trak`, χρώμα ή SVG |
| Μετρικά | typo 1046/−265, win 1169/267, x-height 468, cap-height 682 |
| Hinting upstream | **ναι** (`fpgm`, `prep`, `cvt`), gasp 65535:15 |

## Κάλυψη

- **Latin-1:** 96/96. **Latin Extended-A:** 124/128. **Latin Extended-B:** 120/208.
  **Latin Extended Additional:** 116/256.
- **Ελληνικά:** 78/144 στο βασικό μπλοκ: όλα τα γράμματα του σύγχρονου
  μονοτονικού, τόνος, διαλυτικά.
- **Greek Extended (πολυτονικά):** 233/256. Ο συνδυασμός `ᾳ`, `ἀ` κ.λπ. υπάρχει
  ως έτοιμα glyphs.
- **Κυριλλικά:** 176/256.

## Scripts και features (GSUB/GPOS)

GSUB: `DFLT`, `latn` (με γλώσσες AZE CAT CRT KAZ MOL ROM TAT TRK). GPOS: `DFLT`,
`latn`. Τα Ελληνικά και Κυριλλικά παίρνουν features μέσω DFLT.

GSUB: `aalt case ccmp dlig frac liga lnum locl onum ordn salt ss01 sups`.
GPOS: `kern mark mkmk`.

| feature | τι κάνει |
|---|---|
| `kern` | ενεργό και για Ελληνικά (AV −40, T+o −90, Τα −80, Γα −90 μονάδες) |
| `mark`, `mkmk` | τοποθέτηση συνδυαστικών |
| `liga` | **ενεργό από προεπιλογή:** `ff`, `fi`, `ffi`, `fl` γίνονται λιγκατούρες (`f_f`, `fi`, `f_f_i`, `fl`). Το `ft` μένει χωριστό |
| `ccmp` | σύνθεση/διάσπαση συνδυαστικών |
| `locl` | τουρκικά/αζέρικα/καζάκικα/ταταρικά `i`, ρουμανικά/μολδαβικά Ș Ț, καταλανικά. **Όχι για Ελληνικά** |
| `case` | κεφαλαία context: στο δοκιμαστικό κείμενο δεν άλλαξαν οι παρενθέσεις/παύλες, μόνο συνδυαστικά |
| `lnum` / `onum` | ψηφία: προεπιλογή lining, αναλογικά· το `onum` αλλάζει μόνο το `$` (`dollar.osf`), τα υπόλοιπα ψηφία μένουν ίδια |
| `frac` | **περιορισμένο:** `1/2` → ½ και `1/4` → ¼ (έτοιμα glyphs), τα άλλα κλάσματα μένουν `1/3`, `1/8` ως έχουν |
| `sups` | `²`, `¹`, `³`, `⁴` για τα ψηφία 1–4 (το `H2O` γίνεται `H²O`) |
| `ordn` | `a`/`o` ως ª º μετά από ψηφίο (`2a` → `2ª`, `2o` → `2º`) |
| `dlig` | μόνο `quoteright`/`uni02BC`: στην πράξη δεν αλλάζει κείμενο |
| `salt`, `ss01` | εναλλακτικό `Ŋ` (`Eng.ss01`) |
| `aalt` | πρόσβαση σε όλες τις εναλλακτικές (μέσω UI εφαρμογής) |

Τα `frac`, `sups` και `ordn` ενεργοποιούνται μέσα σε κανονικές λέξεις (`H2O`, `2a`),
γι' αυτό δεν ταιριάζουν ως προεπιλογή για τρέχον κείμενο.

## Τι δεν υπάρχει

Εναλλακτικά πλάτη ψηφίων (`pnum`/`tnum`: τα ψηφία είναι αναλογικά και δεν αλλάζουν), κάθετο μηδέν, small caps, stylistic
sets πέραν του `ss01`, εναλλακτικό `a`, `g` ή `y`, βάρη, πλάγιο, `trak`.

## Μετρήσεις

Βλέπε `README.md` §3.

## Σύσταση για fonts.conf

    <match target="font">
      <test name="family"><string>Didact Gothic</string></test>
      <edit name="fontfeatures" mode="append">
        <string>kern</string><string>liga</string><string>ccmp</string><string>locl</string>
        <!-- <string>onum</string> -->
      </edit>
    </match>
