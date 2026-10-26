# Commissioner 1.012: axes and OpenType features

A reference of what the font can do and how to reach each part of it on Linux.
Everything below was read from
`Commissioner[FLAR,VOLM,wght].ttf` with fontTools 4.67, shaped with HarfBuzz
14.6.0 and rendered with pango 1.58 / GTK 4.24 on 2026-10-26.

**Commissioner's range comes from its axes, not from its features.** Three axes
(weight, flare, volume), 18 GSUB features of which the usable ones are `tnum`
(tabular figures, also for the arithmetic signs), `frac`/`numr`/`dnom`
(arbitrary fractions), `case` (real case-sensitive forms, 39 substitutions),
`ss01` (an alternate `G` with a bar) and `ss02` (the Serbian `б`). There are no
optical size or width axes, no small caps and no old-style figures.

---

## 1. Variation axes

| Tag | Name | Min | Default | Max | What it does |
|---|---|---|---|---|---|
| `wght` | Weight | 100 | **100** | 900 | Thin … Black. Line width +2.2% at 700, +4.5% at 900 over 400 |
| `FLAR` | Flare | 0 | 0 | 100 | Straight grotesque terminals swell into glyphic serifs. Line width +0.5%, ascenders 3/2000 em longer, x-height and cap height unchanged |
| `VOLM` | Volume | 0 | 0 | 100 | Turns the flared serifs into wedges. **Almost no effect on its own**: every extent is identical to FLAR 0, and in the test string only `s` and `Α` change advance width, by 5 and 3 units |

`avar` remaps the weight axis (`wght` 200 → normalized 0.084, 300 → 0.179,
400 → 0.274, 500 → 0.400, 600 → 0.505, 700 → 0.621, 800 → 0.816), so equal
steps of `wght` are not equal steps of boldness. `MVAR` and `HVAR` are present;
line metrics do not change with the axes: `hhea` and the `OS/2` typo values are
2034/-412/0 in every instance (1.223 em, `USE_TYPO_METRICS` set).

**The default weight is Thin.** `fvar` says `wght` 100, `OS/2.usWeightClass` is
100 and the font is named "Commissioner Thin". Applications still get Regular
because pango and the browsers set `wght` from the requested weight (section
1.1), but a renderer that ignores variations shows Thin.

**There is no `slnt` axis in the file this package installs.** Upstream ships
two variable fonts at 1.012 - the roman
(`Commissioner[FLAR,VOLM,wght].ttf`) and the italic
(`Commissioner-Italic[FLAR,VOLM,wght].ttf`) - and a third,
`Commissioner[FLAR,VOLM,slnt,wght].ttf`, which is the same design with a
0..-12° slant axis and 18 named instances. See section 1.3 for why the slanted
one is not used here.

### Named instances

Nine per file, all at `FLAR=0, VOLM=0`:

```
roman    Thin ExtraLight Light Regular Medium SemiBold Bold ExtraBold Black
italic   Thin Italic … Italic … Black Italic      (nameID 17 of the italic file)
```

There are **no named instances for the flare or volume voices** - a variable
font can only expose one named-instance per weight, so `Commissioner Flare` and
`Commissioner Loud` are unreachable from a font name unless something renames
the request. That is what this package's
`conf.avail/79-commissioner-families.conf` does (see README section 3).

### The three voices are axis settings

| Voice | `FLAR` | `VOLM` | Designer's static files |
|---|---|---|---|
| Commissioner | 0 | 0 | `Commissioner-*` |
| Flare | 100 | 0 | `CommissionerFlare-*` |
| Loud | 100 | 100 | `CommissionerLoud-*` |

Verified against the release's own static TTFs by rasterising `H C e` at 200 px
from the variable font at each axis position and from the static file, then
comparing coverage: Flare matches `FLAR=100, VOLM=0` with a difference of
5-14, and `FLAR=100, VOLM=100` with 26-119; Loud is the mirror image. A wrong
guess is 10-20x further away, so the assignment is not ambiguous.

Two more facts fall out of the same measurement: `VOLM` changes no advance
width at all (it reshapes the serifs FLAR created), and a "Loud" voice with
`VOLM` but no `FLAR` is exactly the default voice.

### 1.1 pango and browsers do not render Thin by accident

fontconfig exposes all nine instances as styles of the family `Commissioner`,
and the italic file adds the nine italic styles of the same family. As with
Geologica, pango derives `wght` from the requested weight and picks the italic
file for the italic style, so nothing leaks the Thin default into applications.
Measured on the installed package:

| Request | Rendered as |
|---|---|
| `Commissioner 12` | pixel-identical to `Commissioner 12 @wght=400` |
| `Commissioner Bold 12` | identical to `@wght=700` |
| `Commissioner Thin 12` | identical to `@wght=100` |
| `Commissioner Italic 12` | the italic file at `wght=400`, 12.0° |

Browsers: `font-weight` and `font-style: italic` work the same way, because
upstream ships the italic as its own file with `ital` in `STAT`. Nothing in
this family needs a CSS workaround - unlike Geologica, whose italic depends on
a `CRSV` axis that CSS cannot set.

### 1.2 The x-height barely moves with the weight

HarfBuzz, glyph extents at 2000 upem:

| | Thin 100 | Regular 400 | Bold 700 | Black 900 |
|---|---|---|---|---|
| x-height (`x`) | 992 | 999 | 1007 | 1016 |
| round overshoot (`o` top) | 1008 | 1016 | 1025 | 1036 |
| cap height (`H`) | 1426 | 1426 | 1426 | 1426 |
| ascender (`b`) | 1478 | 1484 | 1492 | 1500 |
| descender (`g` bottom) | -1412 | -1421 | -1434 | -1448 |

24 units (2.4% of the x-height) between Thin and Black, against 80 units for
Geologica. This is the single most important measurement in this document,
because it decides how well ttfautohint's blue zones - taken from the default
(Thin) master - fit the other eight weights. They fit (README section 2).

`FLAR=100` makes the ascender 3 units taller (`b` 1484 → 1487) and leaves
x-height, cap height and the descender alone - `g`, `p`, `q` and `y` end at
exactly the same y. `VOLM` adds nothing on top of that.

### 1.3 The italic is a shear - and the file Google Fonts ships is older

The italic file and the (third) slanted file are the same drawing: the italic
at `wght=w` renders **pixel-identical** to `Commissioner[FLAR,VOLM,slnt,wght]
.ttf` at `slnt=-12`, for `wght` 100/400/900, `FLAR` 0 and 100, in Latin
(`a g n l`), Greek (`Η β`) and Cyrillic; every comparison in that sweep came
out at exactly 0. `post.italicAngle` is -11.997°, `hhea.caretSlopeRun` 425/2000
= 12.0°, and the roman renders 379-1372 of difference away from it, i.e. the
italic is the roman sheared 12° and nothing else. There is no drawn italic with
different letterforms to lose.

The slanted file is nevertheless the one Google Fonts distributes, and it is
**stale**: its name table says `Version 1.001;gftools[0.9.23]`, it has 1123
glyphs and 983 code points, and it is not even inside the 1.012 release
archive. The 1.012 roman and italic have 1172 glyphs and 994 code points and
carry everything the release notes list - tabular figures (`tnum`, including
the arithmetic signs), the alternate `G` (`ss01`), the fraction machinery
(`numr`/`dnom`/`frac`) and the Greek OpenType fixes. Installing the roman and
the italic pair therefore gives the whole 1.012 feature set and the same two
renders at the ends of the slant axis; what it does not give is a continuous
`slnt` between 0 and -12, which is why the PKGBUILD header documents the
slanted file instead of offering it as an option.

### 1.4 A weight-dependent substitution (`rvrn`)

`GSUB.FeatureVariations` has one record: when `wght` is at or above 0.5789
normalized, the `rvrn` feature is replaced by lookup 83. That lookup swaps nine
currency signs for `.BRACKET.varAlt01` designs (`$ ¢ £ ¥ € ₡ ₦ ₲ ₩ ₱`). Measured
with HarfBuzz, the switch happens at **`wght` 665** and is invisible below it.
Nothing to configure; it is a design decision that the currency symbols get a
different (bracketed) drawing in the heavy weights.

### 1.5 Measured effect on line width

HarfBuzz, "Hamburgefonstiv Αλφάβητο 0123", relative to `wght=400, FLAR=0`:

| Setting | Width | | Setting | Width |
|---|---|---|---|---|
| `wght=100` | 98.27% | | `FLAR=50` | 100.24% |
| `wght=700` | 102.15% | | `FLAR=100` | 100.47% |
| `wght=900` | 104.47% | | `VOLM=100` (FLAR 0) | 100.03% |
| | | | `FLAR=100, VOLM=100` | 100.49% |

Half a percent is all the flare axis costs: the serifs are drawn where the
terminals already were rather than added outside them, so the line grows by
0.5% and its texture changes completely. The single exception among the 33
glyphs of the test string is `s`, which grows by 5 units when `VOLM` is added
on top of `FLAR`.

---

## 2. OpenType features

Scripts in `GSUB`: `DFLT`, `latn` (AZE, CAT, CRT, DEU, KAZ, MOL, NLD, ROM, TAT,
TRK), `cyrl` (BGR, BSH, CHU, SRB) and `grek` (no language systems). Unlike
Geologica, **`grek` is a first-class script here**: it declares the same
features as `latn` (minus `locl`), and `GPOS` gives Greek `mark` and `mkmk`
together with `kern`. Greek combining marks are anchored, and caps are
de-accented by `calt` - see "Greek, in detail".

### GSUB

| Feature | On by default | What it does |
|---|---|---|
| `ccmp` | yes | Composes marks (`α`+U+0301 → `alphatonos`), picks the `.case` variant of a combining accent above a capital, and the `.narrow` forms over narrow letters |
| `locl` | yes, per language | TRK/AZE/KAZ/CRT: `i` → `i.loclTRK` (so `fi` cannot ligate and the dot stays); ROM/MOL: `Ş ş Ţ ţ` → `Ș ș Ț ț`; BGR: 18 Cyrillic forms (`Д Л в г д ж з и к л п т ц ш щ ъ ь ю` → `.loclBGR`); SRB: `б` → `.loclSRB`; MKD: `ѓ` → `uni0453`; BSH: `Ғ ғ Ҙ ҙ` → `.loclBSH`; CHU: `Ҫ ҫ` → `.loclCHU`; CAT: `l·l` keeps a `periodcentered.loclCAT`, and a Greek `α·` becomes ano teleia. `NLD` and `DEU` are declared but produced no substitution on any character or pair tried (`ij`, `ĳ`, `ß`, `ẞ`) |
| `liga` | yes | `fi`, `fl`, `ff` → `f_f`, `ffi` → `f_f_i`, `ffl` → `f_f_l`. With `liga` off, `f` becomes `f.calt` (shorter arm) before `l` |
| `calt` | yes | The Greek all-caps setting only: a tonos-bearing capital loses its accent inside a caps run, and the accent moves to a dialytika where the spelling wants one (`ΆΛΦΑ` → `ΑΛΦΑ`, `ΜΆΙΟΣ` → `ΜΑΪΟΣ`, `ΉΤΑ` → `ΗΤΑ`). A capital followed by lowercase keeps it (`Άλφα`, `Ένα`). The Greek ano teleia rule is also reachable through `locl`, so it survives `-calt` |
| `rvrn` | always (required) | Feature variations, see 1.4 |
| `case` | no | **A real case-forms feature** (39 substitutions): `( ) [ ] { } « » ‹ › - – — · @` and the combining accents get capital-height variants. Turning it on globally raises every parenthesis and hyphen in running text, so only for all-caps labels - or per element via `font-feature-settings` |
| `tnum` | no | Tabular figures: all ten digits 1356 units wide, and `+ - × ÷ = ≠ < > ≤ ≥ ± ≈` (`hyphen` excepted, it has no `.tf`) |
| `pnum` | no | **Does nothing**: the default figures are already proportional, and `pnum` only maps the `.tf` glyphs back. Measured: 0 of 36 test strings change |
| `frac` | no | Arbitrary fractions, and **safe for dates**: it only fires on `digit+ / digit+` that is not followed by another slash, so `1/2` → ½, `12/34` → ¹²⁄₃₄, `21/2` → ²¹⁄₂, but `1/2/2026` and `1/2/3` stay plain, `a/1` stays plain, `1 / 2` (with spaces) stays plain |
| `numr` / `dnom` | no | Numerators and denominators for the same digits (`numr` on `123` → `one.numr two.numr three.numr`). Both work on all ten digits, unlike Geologica where only 1-4 exist |
| `sups` | no | Superscript digits 0-9 (`uni2070`, `uni00B9`, `uni00B2`, `uni00B3`, `uni2074`-`uni2079`) |
| `subs` / `sinf` | no | Subscript digits 0-9 (`uni2080`-`uni2089`); `sinf` is the same lookup |
| `ss01` | no | The **alternate `G` with a bar**: `G`, `Ğ`, `Ģ`, `Ǧ`, `Ĝ`, `Ġ` → `.ss01`. No other letter is touched |
| `ss02` | no | `б` → `uni0431.loclSRB`, i.e. the Serbian form for text that is Serbian but not tagged as such. It is the same substitution `locl` does with `lang="sr"` |
| `ordn` | no | `N o .` → `№`, and every digit followed by `a` or `o` is rewritten: `1a` → ª, `2o` → º, `H2O` → `H2º`. Never globally |
| `aalt` | no | "Access all alternates", the glyph-picker feature: 49 glyphs, applies everything at once (`fï` → `f.calt ï`, `No.` → `N º .`, digits → superscripts, `G` → the barred G). Never for running text |

### GPOS

| Feature | What it does |
|---|---|
| `kern` | Class-based pair kerning for Latin, Greek and Cyrillic (`AV` 2672 → 2532 units, `Το` 2468 → 2308, `ΤΑ` 2610 → 2430, `Γα` 2338 → 2178). Digits are not kerned (`0123456789` is unchanged) |
| `mark` | Combining-mark positioning, 8 lookups, for Latin, Greek and Cyrillic alike: `α`+U+0308 puts the diaeresis at (0, -1233) over the alpha, `Α`+U+0308 uses the `.case` mark at (0, -1266) |
| `mkmk` | Mark-on-mark stacking: `ι`+grave+acute stacks the two accents at different heights |

There is **no `cpsp`** in this font (Geologica has one), so there is no
automatic capital spacing to switch on.

### Greek, in detail

1. **Greek is a real script here.** `GSUB.grek` declares every feature except
   `ss02` (the Serbian `б`), and unlike Geologica the marks are anchored:
   `α`+U+0308 renders with a real offset instead of sitting at the pen
   position. `GPOS.grek` carries `kern`, `mark` and `mkmk`.
2. **The all-caps setting can surprise you.** `calt` de-accents a capital when
   the run reads as caps - including a lone capital followed by a comma and a
   space, so the interjection written `Ά, τι να πω` renders as `Α, τι να πω`.
   `Ά.`, `Ά!`, `Ά1` and `Ά α` keep the accent. Unlike Geologica, `Ή` is not
   missing from the lookup: `ΉΤΑ` → `ΗΤΑ` like the other six.
3. **The ano teleia survives `-calt`**, because `locl` performs the same
   `periodcentered` → `anoteleia` substitution for Greek (and
   `periodcentered.loclCAT` for Catalan). `-calt` therefore only costs the
   caps setting.
4. **No polytonic Greek**: 0 of the 256 code points in U+1F00-U+1FFF, and no
   ypogegrammeni (U+0345). Modern monotonic Greek only, 77 code points.

### Figures, measured

| | `zero` | `one` | `two` | `three` | `eight` | `1111 0000` |
|---|---|---|---|---|---|---|
| default (proportional) | 1329 | 905 | 1138 | 1165 | 1237 | 9318 |
| `tnum` | 1356 | 1356 | 1356 | 1356 | 1356 | 11230 (+20.5%) |
| `pnum` | ← identical to default | | | | | 9318 |

Digits are proportional by default, so a column of numbers does not line up
unless you ask for `tnum`. `tnum` also lines up the arithmetic signs, which is
what makes it worth having in a table.

### Not in the font

`smcp c2sc onum lnum zero dlig clig hlig hist titl salt swsh cpsp ss03-ss20
cv01-cv99`. Asking for them does nothing: there are no small caps, no old-style
figures and no slashed zero.

### Dormant glyphs

19 glyphs are in the font but no feature or `cmap` reaches them: the `.lf`
digits (`zero.lf`-`nine.lf`, duplicates of the default lining figures, left
behind by the removal of an `onum` build), eight `.narrow` combining marks
(`uni0302/0304/0306/0308/030C/0311/acutecomb/tildecomb.narrow`),
`dieresistonos.narrow`, `uni030C.alt` and `uni0328.a`. None of them are letter
alternates.

---

## 3. How to use them

### GTK / pango (font description strings)

Axes go after `@`, comma-separated:

```
Commissioner 11                       # wght=400 (pango sets it from the weight)
Commissioner Bold Italic 11           # wght=700, the italic file
Commissioner 11 @FLAR=100             # the Flare voice
Commissioner 11 @FLAR=100,VOLM=100    # the Loud voice
Commissioner 11 @wght=650             # any weight, not just the named ones
```

`gsettings set org.gnome.desktop.interface font-name 'Commissioner 11
@FLAR=100'` works, and so do GTK CSS `font:` strings.

### pango markup

```xml
<span font_desc="Commissioner 11 @FLAR=100">flared</span>
<span font_features="case">ALL CAPS (LABEL)</span>
<span font_features="tnum">1234567890</span>
```

### fontconfig (all pango apps at once)

`fontvariations` must be a **`target="pattern"`** edit; pango ignores it on
`target="font"`. `fontfeatures` works on `target="font"`:

```xml
<match target="pattern">
  <test name="family"><string>Commissioner</string></test>
  <edit name="fontvariations" mode="assign"><string>FLAR=100</string></edit>
</match>
<match target="font">
  <test name="family"><string>Commissioner</string></test>
  <edit name="fontfeatures" mode="assign_replace">
    <string>tnum</string>
  </edit>
</match>
```

The package's `79-commissioner-families.conf` does the first kind for you
(`Commissioner Flare`, `Commissioner Loud`, `Commissioner Semi Flare`).

### CSS (Firefox, Chromium, Electron)

```css
.commissioner {
  font-family: "Commissioner";
  font-weight: 650;                              /* any value 100-900 */
  font-style: italic;                            /* the italic file, 12° */
  font-variant-numeric: tabular-nums;            /* tnum */
  font-feature-settings: "case";                 /* for all-caps text */
  font-variation-settings: "FLAR" 100, "VOLM" 100;  /* Loud */
}
```

Browsers map `font-weight` and `font-style` to the right file the same way
pango does; `font-variation-settings` is the only way to reach `FLAR`/`VOLM`.

---

## 4. Coverage

994 code points, 1172 glyphs:

| Block | Count |
|---|---|
| Basic Latin | 97 |
| Latin-1 Supplement | 96 |
| Latin Extended-A / -B | 186 |
| Latin Extended Additional (Vietnamese etc.) | 164 |
| IPA Extensions (`ə`, U+0259) | 1 |
| Greek and Coptic (monotonic only) | 77 |
| Cyrillic + Cyrillic Supplement | 238 |
| Combining marks | 23 |
| Spacing modifiers, punctuation, super/subscripts | 60 |
| Currency, letterlike, arrows, math | 49 |
| Other (`lozenge`, `fi`, `fl`) | 3 |

There is no small caps, no old-style figures, no Greek Extended and no
`U+0251` (single-storey `ɑ`).
