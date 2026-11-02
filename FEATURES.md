# TikTok Sans — τι μπορεί να κάνει η γραμματοσειρά

Ελέγχθηκε το `TikTokSans[opsz,slnt,wdth,wght].ttf` του google/fonts, commit
`2750b521bd22ce141f12617194ab0e04cf5d12d5` (έκδοση 4.000, 1000 upem). Upstream:
github.com/TikTok/TikTokSans.

## Δομή

| | |
|---|---|
| Άξονες | `opsz` 12–36 (default 36), `wdth` 75–150 (default 100), `wght` 300–900 (default **300**), `slnt` −6–0 (default 0) |
| Στυλ | 14 named instances: Light…Black και τα Italic τους (slnt −6) |
| Πλάγια | ο άξονας `slnt` (−6°): ένα αρχείο για όρθια και πλάγια |
| Glyphs | 1181 |
| Πίνακες | GDEF GPOS GSUB HVAR MVAR STAT avar cvar cvt fpgm fvar gasp gvar prep… Χωρίς `kern`, `trak`, χρώμα ή SVG |
| Μετρικά | typo 1000/−300, win 1118/242, x-height 507, cap-height 705 |
| Hinting upstream | **ναι** (ttfautohint μέσω Google Fonts): 999/1167 περιγράμματα με εντολές |

Προσοχή: το default του `wght` είναι 300, όχι 400. Χωρίς ρητό `wght`, το variable
font εμφανίζεται Light. Το fontconfig/οι browsers ζητούν 400 ως Regular και
ταιριάζουν σωστά.

## Κάλυψη

- **Latin-1:** 92/96. **Latin Extended-A:** 127/128. **Latin Extended-B:** 51/208.
  **Latin Extended Additional:** 160/256 (βιετναμέζικα).
- **Ελληνικά:** 73/144. Όλα τα γράμματα του σύγχρονου μονοτονικού, τόνος,
  διαλυτικά. **Χωρίς πολυτονικά** (0/256). Το `α` + U+0308 δεν έχει anchor
  (προκύπτει `alpha` + `uni0308` χωριστά).
- **Κυριλλικά:** 150/256 (βουλγαρικά, σερβικά, σλαβομακεδονικά, ρωσικά, ουκρανικά).

## Scripts και features (GSUB/GPOS)

GSUB: `DFLT`, `cyrl`, `latn`. GPOS: `DFLT`, `cyrl`, `grek`, `latn`. Τα Ελληνικά
παίρνουν τα GSUB features μέσω DFLT.

GSUB: `aalt calt case ccmp cv01–cv05 dnom frac locl numr ordn pnum rvrn sinf ss01 ss02
ss06 subs sups tnum zero`. GPOS: `kern mark mkmk`. **Δεν υπάρχει `liga`**
(τα `fi`, `fl` μένουν χωριστά γράμματα).

| feature | τι κάνει |
|---|---|
| `kern` | ενεργό και για Ελληνικά (AV −50, T+o −108, Τα −80, Γα −137 μονάδες) |
| `mark`, `mkmk` | τοποθέτηση συνδυαστικών |
| `calt` | ενεργό από προεπιλογή: το `:` ανεβαίνει ανάμεσα σε ψηφία (`12:30` → `colon.calt`) |
| `ccmp` | σύνθεση/διάσπαση συνδυαστικών και `ŀ` |
| `case` | κεφαλαία context: παρενθέσεις, `- + = < > / : ; @ [ ] \ ·` ανεβαίνουν, καταλανικό `l·l` |
| `tnum` / `pnum` | πλάτος ψηφίων: **προεπιλογή αναλογικά (pnum)**, `tnum` δίνει ισοπλατή ψηφία (και σύμβολα νομισμάτων) |
| `zero` | `0` με κάθετο (το ίδιο με `cv03`) |
| `frac`, `numr`, `dnom` | κλάσματα (`1/2` → ½ με αριθμητή/παρονομαστή, **και το `H2O`/`2a` αλλάζουν**: ο αριθμητής επεκτείνεται σε κάθε ψηφίο) |
| `sups`, `subs`, `sinf` | εκθέτες (και γράμματα a–z), δείκτες, επιστημονικοί δείκτες |
| `ordn` | ψηφίο + `a`/`o` → ª º (το `2a` αλλάζει) |
| `locl` | τουρκικά/αζέρικα `i`, βουλγαρικά (Д Л Ф… σε βουλγαρική μορφή), σερβικά/σλαβομακεδονικά `б`, ρουμανικά/μολδαβικά Ș Ț, καταλανικά. **Όχι για Ελληνικά** |
| `ss01` | «Bulgarian Forms» χωρίς να ορίζεις γλώσσα (Д Л Ф в г д ж з и й к л п т ц ш щ ъ ь ю ѝ) |
| `ss02` | «Serbian/Macedonian Forms» `б` |
| `ss06` | «Disambiguation forms»: `0` με κάθετο, `I` με πόδια, `l` με ουρά (και Ί Ι Ϊ І Ї) |
| `cv01` | `I` με πόδια (και Ί Ι Ϊ І Ї) |
| `cv02` | `l` με ουρά |
| `cv03` | `0` με κάθετο |
| `cv04` | εναλλακτικό R/Я |
| `cv05` | εναλλακτικό `3` |
| `aalt` | ένωση εναλλακτικών (225 αντιστοιχίες) |

## Χρήση

- **Ψήσιμο:** `FEATURE_DEFAULTS=tag,...` βάζει features στο `calt` ώστε να τα
  εφαρμόζουν όλα τα προγράμματα. Το `make_features.py` αρνείται τα `aalt`, `ordn`
  (χωρίς `--allow-risky`). Λογικά για κείμενο: `zero`, `ss06`, `cv04`… Όχι
  `frac`/`sups` (πειράζουν κανονικό κείμενο).
- **fontconfig `fontfeatures`:** φτάνει μόνο σε pango/GTK. Δες το block στο
  `~/.config/fontconfig/fonts.conf`.
- **CSS:** `font-feature-settings: "ss06", "tnum", "case", "zero"`.
