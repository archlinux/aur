# Zen Maru Gothic — τι μπορεί να κάνει η γραμματοσειρά

Ελέγχθηκαν τα πέντε static αρχεία του google/fonts, commit
`92503f07b74eab956c1abf4956fbf46170716caa` (έκδοση 1.002, 1000 upem). Το upstream
είναι το googlefonts/zen-marugothic.

## Δομή

| | |
|---|---|
| Άξονες | κανένας: πέντε static, Light 300, Regular 400, Medium 500, Bold 700, Black 900 |
| Πλάγια | δεν υπάρχει |
| Glyphs | 7864 ανά αρχείο (3,7–3,8 MB) |
| Πίνακες | BASE DSIG GDEF GPOS GSUB OS/2 cmap gasp glyf head hhea hmtx loca maxp name post vhea vmtx |
| Μετρικά | typo 880/−120, hhea 1160/−288, win 1160/288, x-height 479, cap-height 700 |
| Hinting upstream | κανένα |
| Οικογένειες | RIBBI: Regular και Bold σε «Zen Maru Gothic». Light, Medium, Black ως ξεχωριστές οικογένειες «Zen Maru Gothic Light/Medium/Black» (nameID 1) και typographic family «Zen Maru Gothic» (nameID 16) |

Το x-height είναι μικρό (479 στα 1000, cap-height 700): τα Latin φαίνονται
μικρά δίπλα στα kanji. Τα ψηφία είναι αναλογικά (0 = 504, 1 = 383), δεν υπάρχει
`tnum`.

## Κάλυψη

- **Latin-1:** 191/224. **Latin Extended-A:** 8/128. **Latin Extended-B:** 0/208.
  Δεν στηρίζονται τσεχικά, πολωνικά, ρουμανικά, τουρκικά κ.λπ.
- **Ελληνικά:** 73/144. Όλα τα γράμματα του σύγχρονου μονοτονικού, τόνος και
  διαλυτικά (`ά έ ή ί ό ύ ώ ϊ ϋ ΐ ΰ`), `;` και `·`. **Χωρίς πολυτονικά**
  (0/256 στο Greek Extended).
- **Κυριλλικά:** 66/256 (βασικά).
- **Ιαπωνικά:** Hiragana 88/96, Katakana 94/96, CJK 6682/20992, halfwidth/fullwidth 158/240.

## Scripts και features (GSUB/GPOS)

Και τα δύο έχουν **μόνο** script `DFLT`: δεν υπάρχει `latn`, `grek` ή `cyrl`,
οπότε τα Ελληνικά παίρνουν τα features μέσω DFLT.

GSUB: `aalt case ccmp frac fwid hwid ordn sups vert vkna vrt2`.
GPOS: `kern mark mkmk`.

| feature | τι κάνει |
|---|---|
| `kern` | ενεργό και για Ελληνικά (AV 80, ΤΑ 100, Το 60, Γα 60 μονάδες) |
| `mark`, `mkmk` | τοποθέτηση συνδυαστικών (U+0308 κ.λπ.) |
| `ccmp` | συνθέτει α+U+0301 → ά, i+U+0301 → í (composition μόνο) |
| `case` | **μόνο** `tonos` → `tonos.case` (κεφαλαίο τόνος). Δεν αγγίζει σημεία στίξης |
| `frac` | `1/4` και `1/2`, `3/4` → έτοιμα glyphs (2 υποκαταστάσεις) |
| `sups` | μόνο 1 2 3 4 → ¹ ² ³ ⁴ |
| `ordn` | `No.` → № |
| `fwid` | 95 Latin/ψηφία/σημεία → fullwidth (Ａ, １, （ …). Επηρεάζει και τα Ελληνικά σημεία στίξης, όχι τα γράμματα |
| `hwid` | 62 katakana → halfwidth |
| `vert`, `vrt2`, `vkna` | κάθετη γραφή: 74 glyphs (22 στο `vkna`). `「」ー` → κάθετες μορφές |
| `aalt` | ένωση εναλλακτικών (200 αντιστοιχίες): fullwidth κ.λπ. |

Δεν υπάρχουν `liga`, `tnum`, `lnum`, `smcp`, `ss01`–`ss20`, `locl`, `calt`.
`fi`/`fl` δεν σχηματίζουν συνδετικά.

Τα μόνα features που έχουν νόημα για Latin/Greek κείμενο είναι τα `frac`, `sups`
και `case` (στο Ελληνικό μόνο ο τόνος). Τα `fwid`/`hwid`/`vert` ανήκουν στη CJK
τυπογραφία και δεν πρέπει να είναι default.

## Χρήση

- **Ψήσιμο:** `FEATURE_DEFAULTS=case` (ή `frac`) βάζει το feature στο `calt`
  ώστε να το εφαρμόζουν όλα τα προγράμματα. Δεν προτείνεται default για κανένα.
- **Από το fonts.conf:** `FEATURE_DEFAULTS=fonts.conf` ψήνει όσα features είναι
  ενεργά στο block της οικογένειας (παραλείπονται τα always-on και όσα δεν υπάρχουν).
- **fontconfig `fontfeatures`:** φτάνει μόνο σε pango/GTK. Δες το block στο
  `~/.config/fontconfig/fonts.conf`.
- **CSS:** `font-feature-settings: "frac", "sups", "case"`.
