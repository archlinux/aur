# Geom — τι μπορεί να κάνει η γραμματοσειρά

Ελέγχθηκαν το `Geom[wght].ttf` και το `Geom-Italic[wght].ttf` του google/fonts,
commit `a60a77e14f28abd4ef243a1b5dfc48df0cec5205` (έκδοση 1.102, 1000 upem).
Upstream: ThanosPoulakidas/Geom.

## Δομή

| | |
|---|---|
| Άξονες | μόνο `wght` 300–900, default 400 (δεν έχει wdth/slnt/ital) |
| Στυλ | 7 named instances: Light, Regular, Medium, SemiBold, Bold, ExtraBold, Black |
| Πλάγια | ξεχωριστό variable font, italic angle −10° |
| Glyphs | 516 |
| Πίνακες | GDEF GPOS GSUB HVAR STAT gasp fvar gvar. Χωρίς `kern`, `trak`, `vhea`, χρώμα ή SVG |
| Μετρικά | typo 1015/−235, win 1116/315, x-height 536, cap-height 712 |
| Hinting upstream | κανένα (μόνο `prep` και `gasp`) |

Το x-height είναι ίδιο σε όλα τα βάρη (536).

## Κάλυψη

- **Latin-1:** 190/224. **Latin Extended-A:** 126/128. **Latin Extended-B:** 14/208
  (μεταξύ άλλων τα ρουμανικά ș ț). Βιετναμέζικα: 2/90 (δεν στηρίζονται).
- **Ελληνικά:** 77/144. Όλα τα γράμματα του σύγχρονου μονοτονικού, τόνος,
  διαλυτικά (`ϊ ϋ ΐ ΰ`). **Χωρίς πολυτονικά** (0/256 στο Greek Extended).
- **Κυριλλικά: καθόλου** (0/256).

## Scripts και features (GSUB/GPOS)

GSUB: `DFLT`, `latn`. GPOS: `DFLT`, `grek`, `latn`. Τα Ελληνικά παίρνουν τα
GSUB features μέσω DFLT.

GSUB: `aalt case ccmp dlig frac liga locl ordn sups`. GPOS: `kern mark mkmk`.

| feature | τι κάνει |
|---|---|
| `kern` | ενεργό και για Ελληνικά (AV 67, ΤΑ 55, Το 82, Γα 88 μονάδες) |
| `mark`, `mkmk` | τοποθέτηση συνδυαστικών |
| `liga` | **ενεργό από προεπιλογή σε κάθε shaper:** `fi fl ff ffi ffl` → ένα glyph |
| `ccmp` | χωρίζει τα glyphs `fi`/`fl` πίσω σε `f`+`i` όταν το liga είναι κλειστό, και συνθέτει α+τόνο → ά |
| `dlig` | `ft`, `tt`, `www` → f_t, t_t, w_w_w |
| `case` | μόνο `tonos` → `tonos.case` και το catalan `l·l` (periodcentered.loclCAT) |
| `frac` | 7 κλάσματα: 1/8 1/4 1/2 3/8 5/8 3/4 7/8 → έτοιμα glyphs. Ταιριάζει ακολουθίες χαρακτήρων: το `21/2` γίνεται 2 + ½ |
| `sups` | όλα τα ψηφία 0–9 → ⁰ ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹ |
| `ordn` | ψηφίο + `a`/`o`/`O` → ª º (το `H2O` και το `2a` αλλάζουν) |
| `locl` | `i` → τούρκικο/αζέρικο `i.loclTRK`, ρουμανικά ș ț (comma below), καταλανικό `l·l` |
| `aalt` | ένωση εναλλακτικών (23 αντιστοιχίες): ordinals, J/j + τόνος, ș ț, i.loclTRK |

Δεν υπάρχουν `calt`, `tnum`, `pnum`, `onum`, `lnum`, `smcp`, `zero` ούτε
stylistic sets `ss01`–`ss20`/`cv`. Τα ψηφία είναι αναλογικά (0 = 636, 1 = 330 μονάδες).

Προσοχή: **το `liga` είναι ήδη ενεργό** (οι συνδυασμοί fi/fl/ff εμφανίζονται
πάντα ως ligature, όπως ζητά κάθε shaper). Για να τα κλείσεις: `font-feature-settings:
"liga" 0` ή στο fontconfig `<string>-liga</string>` (μόνο pango/GTK).

## Χρήση

- **Ψήσιμο:** `FEATURE_DEFAULTS=tag,...` βάζει features στο `calt` ώστε να τα
  εφαρμόζουν όλα τα προγράμματα. Το `make_features.py` αρνείται τα `aalt`, `ordn`
  και `dlig` (τα ft/tt/www μένουν μόνο μέσω CSS/pango). Τα `frac`/`sups` δεν
  προτείνονται (πειράζουν κανονικό κείμενο: `21/2`).
- **Από το fonts.conf:** `FEATURE_DEFAULTS=fonts.conf` ψήνει όσα features είναι
  ενεργά στο block της οικογένειας (παραλείπονται τα always-on και όσα δεν υπάρχουν).
- **fontconfig `fontfeatures`:** φτάνει μόνο σε pango/GTK. Δες το block στο
  `~/.config/fontconfig/fonts.conf`.
- **CSS:** `font-feature-settings: "dlig", "frac", "sups", "case"`.
