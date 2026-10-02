# Roboto Flex 3.200: axes and OpenType features

A complete reference of what the font can do and how to reach each part of
it on Linux. Everything below was read from the font file with fontTools and
checked by shaping with HarfBuzz 14.5 and rendering with pango 1.58 / GTK
4.22 on 2026-10-02.

**What sets Roboto Flex apart is its axes, not its OpenType features.** It has
13 variation axes but only four GSUB features. It has no stylistic sets, character variants, small caps,
fractions, superscripts, case forms or `tnum`. The figures are already tabular
by default.

---

## 1. Variation axes

| Tag | Name | Min | Default | Max | Hidden | What it does |
|---|---|---|---|---|---|---|
| `wght` | Weight | 100 | 400 | 1000 | | Thin … ExtraBlack. Changes advance widths (+6 % at 700) |
| `wdth` | Width | 25 | 100 | 151 | | SuperCondensed … ExtraExpanded. Limited at text sizes, see below |
| `opsz` | Optical size | 8 | 14 | 144 | | Small sizes: larger x-height, looser, sturdier. Large: tighter, finer |
| `GRAD` | Grade | −200 | 0 | 150 | | Stroke weight **without changing any advance width**: no reflow |
| `slnt` | Slant | −10 | 0 | 0 | | The italic. There is no separate italic file |
| `XOPQ` | Parametric thick stroke | 27 | 96 | 175 | yes | Vertical stem thickness |
| `YOPQ` | Parametric thin stroke | 25 | 79 | 135 | yes | Horizontal stroke thickness (contrast) |
| `XTRA` | Parametric counter width | 323 | 468 | 603 | yes | Width of the counters (81 % … 126 % line width) |
| `YTUC` | Parametric uppercase height | 528 | 712 | 760 | yes | Cap height |
| `YTLC` | Parametric lowercase height | 416 | 514 | 570 | yes | x-height |
| `YTAS` | Parametric ascender height | 649 | 750 | 854 | yes | Ascenders (b d h k l) |
| `YTDE` | Parametric descender depth | −305 | −203 | −98 | yes | Descenders (g j p q y) |
| `YTFI` | Parametric figure height | 560 | 738 | 788 | yes | Height of the digits |

"Hidden" axes are flagged so font pickers do not show them. They still work
everywhere a variation string is accepted.

### Named instances

20 instances, all at `opsz=14`, `wdth=100`: Thin, ExtraLight, Light, Regular,
Medium, SemiBold, Bold, ExtraBold, Black, ExtraBlack, and each of them Italic
(`slnt=-10`). fontconfig lists them as styles of the family **Roboto Flex**.

### Measured effect on line width

HarfBuzz, "Hamburgefonstiv Παράθυρο ρυθμίσεις", relative to the default:

| Setting | Width | | Setting | Width |
|---|---|---|---|---|
| `wght=700` | 106.0 % | | `GRAD=150` | 100.0 % |
| `opsz=8` | 106.6 % | | `GRAD=-200` | 100.0 % |
| `opsz=144` | 79.4 % | | `slnt=-10` | 100.0 % |
| `XTRA=323` | 81.3 % | | `XTRA=603` | 125.5 % |

`wdth` depends on the optical size. The designers restrain it at text sizes
through `avar`:

| opsz | wdth 25 | wdth 50 | wdth 75 | wdth 125 | wdth 151 |
|---|---|---|---|---|---|
| 8 | 89 % | 93 % | 96 % | 109 % | 119 % |
| 11 | 89 % | 92 % | 96 % | 108 % | 117 % |
| 14 | 88 % | 92 % | 96 % | 108 % | 115 % |
| 24 | 79 % | 86 % | 93 % | 110 % | 120 % |
| 36 | 67 % | 78 % | 89 % | 113 % | 126 % |
| 72 | 49 % | 66 % | 83 % | 117 % | 136 % |
| 144 | 39 % | 59 % | 80 % | 120 % | 141 % |

In UI text (opsz ≈ 9–14) even SuperCondensed is only ~11 % narrower. The
dramatic widths are meant for headlines.

### Automatic optical size

pango sets `opsz` to the font size **in points** for any font with an opsz
axis (verified: `Roboto Flex 8` renders pixel-identical to
`Roboto Flex 8 @opsz=8`, `Roboto Flex 36` to `@opsz=36`). Firefox and Chromium
(`font-optical-sizing: auto`, the default) set it to the size in **CSS px**.
There is nothing to configure.

---

## 2. OpenType features

Scripts: `DFLT` and `latn` (with language systems AZE, CAT, CRT, MOL, NLD,
ROM, TRK). Greek and Cyrillic have no script entry of their own; HarfBuzz uses
the `DFLT` features for them, so kerning, marks and `pnum` apply to Greek and
Cyrillic as well.

### GSUB

| Feature | On by default | What it does |
|---|---|---|
| `liga` | yes | 6 ligatures: ff fi fl ffi ffl and f‑f‑ĳ |
| `locl` | yes, per language | TRK/AZE/CRT: `i` → `idotaccent`, so `fi` is **not** ligated and the dot stays. NLD: `ij` → `ĳ`. ROM/MOL: `Ş ş Ţ ţ` → `Ș ș Ț ț` (comma below). CAT is declared, no visible change for `l·l` |
| `pnum` | no | Proportional figures. Default figures are tabular (all 1156 units wide); with `pnum` "1111 0000" is 17 % narrower |
| `rvrn` | always (required) | Feature variations: at `wght` ≥ 600 or `wdth` ≤ 85 the currency signs `$ ¢ ₦ ₩ ₡ ₱ ₲ ₵` switch to simpler forms with fewer bars, so they do not clog up. `₴` also switches at `opsz` ≤ 12 |

### GPOS

| Feature | What it does |
|---|---|
| `kern` | Class-based pair kerning (Latin, Greek, Cyrillic). On by default |
| `mark` / `mkmk` | Combining-mark positioning, mark-on-mark stacking (Vietnamese). On by default |

### Not in the font

`calt clig dlig case smcp c2sc onum lnum tnum frac numr dnom sups subs ordn
zero ss01–ss20 cv01–cv99 salt swsh hist titl`. Asking for them does nothing.
`tnum` is the default behaviour already. For a slashed zero or small caps you
need a different font.

**No letter alternates at all.** The font has no alternate glyph for `a` or any
other Latin or Greek letter. There is no single-storey `ɑ` (U+0251 is not
even in the cmap), so no fontconfig `fontfeatures` setting can change a
letter's form. Letter *proportions* can be changed for all letters at once
through the axes (`XTRA` counters, `YTLC` x-height, `XOPQ`/`YOPQ` contrast,
`GRAD`, `wdth`); see §3. For a single-storey `a`, use Inter (`cv11`) or
SF Pro Text (`ss07`).

### Dormant glyphs

78 suffixed glyph variants are in the font but no GSUB lookup reaches them.
The upstream build left out the features that would use them. 69 of them
have outlines different from the base glyph. (A further 22 unsuffixed glyphs
are not in the cmap either. Most are components of precomposed glyphs, e.g.
`tonoscomb` and `dieresistonoscomb` for Greek, the stacked Vietnamese accents
and `jdotless`.)

| Glyphs | Purpose | Feature that would use them |
|---|---|---|
| `uni0414.bgr` … `uni044E.bgr`, `uni0069.bgr`, `uni00EC.bgr` (24) | Bulgarian forms (Д Ж К Л, в г д ж з й к л н п т ц ч ш щ ъ ь ю, i ì) | `locl` for `cyrl`/`BGR` |
| `uni0300.case` … `uni0384.case`, `*comb*.case` (42) | Combining accents sized and placed for capitals | `case` / `ccmp` |
| `Jacute.loclNLD`, `jacute.loclNLD` | Dutch `J́ j́` | `locl` NLD (only `ij` is wired) |
| `uni030C.alt` | Short caron for `ď ľ ť` | `ccmp` |
| `uni0431.locl`, `uni0433.locl` … `uni0442.locl` (5) | Serbian/Macedonian forms; 4 of them identical to the base glyphs in the upright | `locl` for `SRB`/`MKD` |
| `uni02D8.cyr` | Cyrillic breve | `ccmp` |
| `diagonalbarO.rvrn`, `diagonalbaro.rvrn` | bar-free forms for heavy/narrow instances | `rvrn` (not wired) |

9 of the 78 (`uni0323.case`, the `uni00B7.loclCAT` pair, `uni043D.bgr`,
`uni0447.bgr` and four Serbian `.locl` glyphs) are identical to their base
glyph in the default instance. Nothing here affects Latin or Greek text.
Wiring them up would mean writing new GSUB lookups into the variable font
(keeping its `rvrn` FeatureVariations). This package does not do that; it
ships upstream's GSUB unchanged.

---

## 3. How to use them

### GTK / pango (font description strings)

Axes go after `@`, comma-separated:

```
Roboto Flex 11                        # opsz=11 automatically
Roboto Flex Bold Italic 11            # wght=700, slnt=-10 (needs 81-roboto-flex-italic.conf)
Roboto Flex 11 @wdth=75,GRAD=-25
Roboto Flex 11 @XTRA=420,YTLC=530     # parametric axes
```

`gsettings set org.gnome.desktop.interface font-name 'Roboto Flex 11 @GRAD=-25'`
works, and so do GTK CSS `font: ...` strings.

### pango markup

```xml
<span font_desc="Roboto Flex 11 @wdth=75">condensed</span>
<span font_features="pnum">1234567890</span>
<span font_features="liga=0">office</span>
```

### fontconfig (all pango apps at once)

Two properties, both read by pango only (Firefox and Chromium ignore them):

- `fontfeatures` (feature strings like `pnum`, `-liga`)
- `fontvariations` (`wdth=75`, `GRAD=-25`). Must be a **`target="pattern"`**
  edit; pango ignores it on `target="font"` (verified).

`79-roboto-flex-families.conf` uses this to define font names such as
`Roboto Flex Condensed` or `Roboto Flex Dark`; see `README.md`.

### CSS (Firefox, Chromium, Electron)

```css
font-family: "Roboto Flex";
font-weight: 650;                 /* any value 100–1000 */
font-stretch: 75%;                /* wdth */
font-style: oblique 10deg;        /* slnt */
font-variant-numeric: proportional-nums;   /* pnum */
font-variation-settings: "GRAD" -25, "XTRA" 420;
```

Prefer `oblique 10deg` over `italic`: the font has no `ital` axis, and
whether a browser maps `italic` to `slnt` or synthesizes a slant was not
tested here.

---

## 4. Coverage

826 code points, 948 glyphs: Latin (Basic, Latin-1, Extended-A/B, Extended
Additional, so Vietnamese is covered), Greek (77, monotonic), Cyrillic (152), plus
punctuation, currency and symbols. There is no polytonic Greek Extended block.
