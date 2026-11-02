# Akt — τι μπορεί να κάνει η γραμματοσειρά

Ελέγχθηκε το `Akt[wght].ttf` του google/fonts, commit
`d36f78e60bb8424f6c2a2eb9b4bd717cd4d77651` (έκδοση 1.100, 1000 upem).

## Δομή

| | |
|---|---|
| ξονες | μόνο `wght` 100–900, default 400 (με `avar`) |
| Στυλ | 9 named instances: Thin, ExtraLight, Light, Regular, Medium, SemiBold, Bold, ExtraBold, Black |
| Πλάγια | **δεν υπάρχει** (ούτε `slnt`/`ital`) |
| Glyphs | 1867 |
| Πίνακες | GDEF GPOS GSUB HVAR MVAR STAT avar fvar gasp gvar. Χωρίς `kern`, `trak`, χρώμα ή SVG |
| Μετρικά | typo 950/−250, win 1200/500, x-height 500, cap-height 700 |
| Hinting upstream | κανένα (μόνο `prep` και `gasp`) |

## Κάλυψη

- **Latin-1:** 95/96. **Latin Extended-A:** 128/128. **Latin Extended-B:** 99/208.
  **Latin Extended Additional:** 141/256 (πλήρη βιετναμέζικα).
- **Ελληνικά:** 78/144. Όλα τα γράμματα του σύγχρονου μονοτονικού, τόνος,
  διαλυτικά (`ϊ ϋ ΐ ΰ`). **Χωρίς πολυτονικά** (9/256 στο Greek Extended).
  Το `α` + U+0308 δεν έχει anchor (το διαλυτικό δεν τοποθετείται σωστά πάνω
  στο α)· τα έτοιμα `ϊ ϋ ΐ ΰ` δουλεύουν κανονικά.
- **Κυριλλικά:** 220/256, μαζί με τα επεκτεταμένα (βουλγαρικά, σερβικά, σλαβομακεδονικά κ.ά.).

## Scripts και features (GSUB/GPOS)

GSUB: `DFLT`, `cyrl`, `latn`. GPOS: `DFLT`, `cyrl`, `grek`, `latn`. Τα Ελληνικά
παίρνουν τα GSUB features μέσω DFLT.

GSUB: `aalt case ccmp cv01–cv08 dlig dnom frac liga lnum locl numr onum ordn sinf
ss01–ss06 subs sups`. GPOS: `kern mark mkmk`.

| feature | τι κάνει |
|---|---|
| `kern` | ενεργό και για Ελληνικά |
| `mark`, `mkmk` | τοποθέτηση συνδυαστικών |
| `liga` | **ενεργό από προεπιλογή σε κάθε shaper** (fi/fl κ.ά.) |
| `ccmp` | σύνθεση/διάσπαση συνδυαστικών |
| `case` | κεφαλαία context: παρενθέσεις, `/ : ; · + - = < >` ανεβαίνουν, τα oldstyle ψηφία γίνονται lining, `l·l` καταλανικά |
| `onum` / `lnum` | oldstyle / lining ψηφία. **Προεπιλογή: αναλογικά lining** |
| `frac`, `numr`, `dnom` | κλάσματα και αριθμητές/παρονομαστές |
| `sups`, `subs`, `sinf` | εκθέτες, δείκτες |
| `ordn` | ψηφίο + `a`/`o` → ª º |
| `dlig` | διακριτικά ligatures |
| `locl` | τουρκικά/αζέρικα (TRK), βουλγαρικά (BGR), σερβικά (SRB), σλαβομακεδονικά (MKD), BSH, ΧΣΛ (CHU), MAH, ρουμανικά (ROM), πολωνικά (PLK). **Όχι για Ελληνικά** |
| `ss01` | «Flat-tailed»: a/R με επίπεδη ουρά· αφορά και τα ελληνικά `α ά` |
| `ss02` | «Tailed»: ουρά σε a, y, l, f, Q· αφορά και το ελληνικό `α` |
| `ss03` | «No-tailed»: j, t, ţ χωρίς ουρά |
| `ss04` | «Akzidenz»: Ж К И Й Ф Я (κυριλλικά) |
| `ss05` | «Historic»: Ξ Υ Ύ Ϋ (ελληνικά) και τ (κυριλλικό) |
| `ss06` | «Experimental»: Ы ы |
| `cv01` | εναλλακτικό a (όλα τα ακόμη με τόνους) |
| `cv02` / `cv06` | εναλλακτικό g / G |
| `cv03` | `0` με κάθετο/διάστιξη |
| `cv04` | 1 glyph (άγνωστο, δεν χρησιμοποιείται) |
| `cv05` | I με πόδια (και Ί Ι Ϊ І Ї) |
| `cv07` | εναλλακτικό K k (και Κ κ ελληνικά, Ж Ќ) |
| `cv08` | εναλλακτικό `4` |
| `aalt` | ένωση εναλλακτικών |

Τα `cv` δεν έχουν ονόματα στο font· οι περιγραφές προέρχονται από τα glyphs που
αντικαθιστούν.

## Χρήση

- **Ψήσιμο:** `FEATURE_DEFAULTS=tag,...` βάζει features στο `calt` ώστε να τα
  εφαρμόζουν όλα τα προγράμματα. Το `make_features.py` αρνείται τα
  `aalt`, `ordn`, `dlig` (χωρίς `--allow-risky`). Λογικά για κείμενο:
  `ss01`, `onum`, `cv02`… Όχι `frac`/`sups` (πειράζουν κανονικό κείμενο).
- **fontconfig `fontfeatures`:** φτάνει μόνο σε pango/GTK. Δες το block στο
  `~/.config/fontconfig/fonts.conf`.
- **CSS:** `font-feature-settings: "ss01", "onum", "case", "cv02"`.
