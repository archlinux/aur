# Geologica 1.010: axes and OpenType features

A reference of what the font can do and how to reach each part of it on Linux.
Everything below was read from
`Geologica[CRSV,SHRP,slnt,wght].ttf` with fontTools 4.67, shaped with HarfBuzz
14.6.0 and rendered with pango 1.58.2 / GTK 4.24 on 2026-10-26.

**Geologica's range comes from its axes, not from its features.** Four axes
(one of them binary) and 13 GSUB features, of which the interesting ones are
`ss01`/`CRSV` (cursive `a g`) and `tnum` (tabular figures). There are no
optical size or width axes, and the figures are proportional by default.

---

## 1. Variation axes

| Tag | Name | Min | Default | Max | Hidden | What it does |
|---|---|---|---|---|---|---|
| `wght` | Weight | 100 | **100** | 900 | | Thin … Black. Line width +4.4% at 700, +7.2% at 900 |
| `SHRP` | Sharpness | 0 | 0 | 100 | | `Blunt` … `Sharp`: terminal treatment and inner points. Ascenders/descenders +40/2000 em, x-height and cap height unchanged, line width -0.2% |
| `CRSV` | Cursive | 0 | 0 | 1 | | Binary switch at 0.5. `Roman` … `Cursive`: substitutes cursive `a g` (and the accented `a` forms) through `rvrn`. Line width +0.8% |
| `slnt` | Slant | -12 | 0 | 0 | | `Default` … `Oblique`: shears the outline. Line width +0.4% |

There is no `avar`, so the axes are linear in normalized space, and no
`opsz`/`wdth`/`GRAD`. `MVAR` and `HVAR` are present; line metrics do not change
with the axes (1.25 em in every instance).

**The default weight is Thin.** `fvar` says `wght` 100, `OS/2.usWeightClass`
is 100 and the fonts are named "Geologica Thin". Applications still get
Regular by default because pango and browsers set `wght` from the requested
weight (verified: "Geologica 12" is pixel-identical to `@wght=400`), but a
renderer that ignores variations shows Thin.

### Named instances

18, all at `SHRP=0`: the nine weights upright, and the nine italic at
`CRSV=1, slnt=-12`. fontconfig lists them as styles of `Geologica`:

```
Thin ExtraLight Light Regular Medium SemiBold Bold ExtraBold Black
Thin Italic ExtraLight Italic Light Italic Italic Medium Italic
SemiBold Italic Bold Italic ExtraBold Italic Black Italic
```

There is no `SHRP` instance: the Sharp family comes from the axis (or from
`GEO_VARIANT=static STATIC_SHRP=100`, or the `Geologica Sharp` fontconfig
preset).

### Measured effect on line width

HarfBuzz, "Hamburgefonstiv Αλφάβητο 0123", relative to `wght=400`:

| Setting | Width | | Setting | Width |
|---|---|---|---|---|
| `wght=100` | 95.6% | | `SHRP=100` | 99.8% |
| `wght=700` | 104.4% | | `CRSV=1` | 100.8% |
| `wght=900` | 107.2% | | `slnt=-12` | 100.4% |
| | | | `slnt=-12,CRSV=1` | 101.3% |

---

## 2. OpenType features

Scripts in `GSUB`: `DFLT`, `latn` (AZE, CAT, CRT, KAZ, MOL, ROM, TAT, TRK),
`cyrl` (BGR, MKD, SRB) – and **nothing for `grek`**. Greek drafts through
`DFLT`, which carries every feature except `locl`, so every substitution
described below reaches Greek text. `GPOS` does declare `grek`, but with `kern`
only: **no `mark`, no `mkmk`, no `cpsp`**. Greek kerning applies; Greek
combining marks are not anchored (see "Greek, in detail"). `locl` is only
registered for the languages in its row.

### GSUB

| Feature | On by default | What it does |
|---|---|---|
| `ccmp` | yes | Composes marks: precomposed accents, `.case` variants for capitals, `.narrow`/`.wide` combining marks |
| `locl` | yes, per language | TRK/AZE/CRT: `i` → `i.loclTRK` (so `fi` cannot ligate and the dot stays); ROM/MOL: `Ş ş Ţ ţ` → `Ș ș Ț ț`; BGR: 19 Cyrillic forms (`Д Л в г д ж з и к л н п т ц ч ш щ ъ ь ю` → `.loclBGR`); SRB: `б г д п т` → `.loclSRB`; MKD: `ѓ` → `.loclMKD`; KAZ: the same TRK `i`; CAT: declared, no substitution in this build |
| `liga` | yes | `ff` → `f_f`, `fi`, `fl`, `ffi` → `f_f_i`, `ffl` → `f_f_l` |
| `calt` | yes | The only contextual feature. Four jobs: (a) Greek all-caps setting – a tonos-bearing capital loses it in a caps run (`ΆΛΦΑ` → `ΑΛΦΑ`, `Ά Β` → `Α Β`, and `ΜΆΙΟΣ` → `ΜΑΪΟΣ`, the tonos becoming the dialytika of the correct spelling), while a capital followed directly by lowercase keeps it (`Άλφα`); (b) a lone accented capital loses it as soon as text follows (`Ά, τι να πω` → `Α, τι να πω`), and not all seven letters are in that lookup – `Ή` always keeps its accent, `Ά Έ Ί Ό Ύ Ώ` do not; (c) a `periodcentered` after a Greek letter at a word end becomes U+0387 ano teleia (`α·`), while between two letters it stays U+00B7; (d) collision repairs – `f` becomes `f.calt` (shorter arm) before a dotted i/j carrying an accent (`fï fî ĩ ĵ ḯ`), and `j` becomes `j.calt` after a glyph with a descender (`qj ζj дj`) |
| `rvrn` | always (required) | Feature variations; see below |
| `ss01` | no | The **cursive** `a g`: 42 glyphs, `a`→`a.ss01`, `g`→`g.ss01`, every accented `a`, Cyrillic `а ѓ ӑ ӓ ӕ`, and `ordfeminine`. Nothing Greek. Pixel-identical to `CRSV=1` – this is how a browser reaches the cursive forms |
| `tnum` | no | Tabular figures: all ten digits 1296 units wide |
| `pnum` | no | **Does nothing**: the default figures are already proportional, the feature maps `one.tf` back to `one` and is only useful to undo `tnum` |
| `frac` | no | Only `1/4`, `1/2`, `3/4` (no arbitrary fractions, no `numr`/`dnom`). Matches the character sequence, not the meaning: `1/2/2026` → ½/2026, `21/2` → 2½, `3/4/5` → ¾/5 |
| `sups` | no | Only `1 2 3 4` (`uni00B9 B2 B3 2074`); no subscript feature |
| `ordn` | no | `No.` → `uni2116` (№), and every digit followed by `a` or `o` is rewritten: `1a` → ª, `2o` → º, `H2O` → H2º |
| `case` | no | **Not a case-sensitive-forms feature**: it raises no bracket, no dash and no digit, and touches no Latin at all. It repeats a subset of `calt`'s Greek rules (the de-accenting and the dialytika transfer), so with `calt` on it changes nothing – measured on every codepoint and on 180 letter+punctuation pairs. Only useful together with `-calt` |
| `aalt` | no | "Access all alternates", the glyph-picker feature. Applies every alternate at once: `A`→ª, `O`→º, `No.`→№, digits→`.tf`, `ş`→`ș`. Never for running text |

### GPOS

| Feature | What it does |
|---|---|
| `kern` | Class-based pair kerning, and the only GPOS feature registered for `grek` besides `DFLT`/`latn`/`cyrl`. `AV` 2580→2520 units, `Το` 2256→2136, `ΤΑ` 2408→2318, `Γα` 2310→2190. Digits kern too: `0123456789` is 80 units narrower with it on |
| `cpsp` | Capital spacing: +40/2000 em after a capital when the next glyph is also a capital. `AB` widens; `A B`, `A1` and `A-B` do not; Greek capitals never do (no `grek` entry) |
| `mark` / `mkmk` | Combining-mark positioning, mark-on-mark stacking (Vietnamese), for Latin and Cyrillic. Not for Greek – see below |

### Greek, in detail

Three consequences of `GSUB` having no `grek` entry and of `GPOS.grek` carrying
`kern` alone:

1. **Every GSUB feature does reach Greek**, because `DFLT` carries all of them
   except `locl`. `ss01`, `tnum`, `calt`, `case` and the rest are not
   Latin-only.
2. **Combining marks are not anchored.** `ccmp` composes the ones that have a
   precomposed glyph (`α`+U+0301 → `alphatonos`, and above a capital it picks
   the `.case` variant of the mark), but a mark with no precomposed
   counterpart, such as `α`+U+0308, is left at the pen position of the base
   glyph: zero offset, no anchor. Use precomposed characters for Greek.
3. **No polytonic Greek.** There is no Greek Extended coverage at all (0 of the
   256 code points in U+1F00–U+1FFF), and no ypogegrammeni (U+0345) either.

The all-caps behaviour of `calt` is worth knowing because it fires without
being asked for, and it is not applied consistently: `Ή` is missing from the
lookup and keeps its tonos in every context, while the other six accented
capitals lose it as soon as the font reads the run as caps – and also when the
letter stands alone and text follows, so the interjection `Ά, τι να πω`
renders as `Α, τι να πω`. `-calt` is the only switch, and it also turns off
the ano teleia and the `f`/`j` collision repairs.

### Feature variations (`rvrn`)

Geologica's only `rvrn` lookups are applied by `GSUB.FeatureVariations`, i.e.
by axis position, not by user request:

| Condition (normalized) | Lookups | Effect |
|---|---|---|
| `wght` ≥ 566 (0.583) | 1 | `colonmonetary` → `colonmonetary.bold` (fewer bars in `₡`) |
| `CRSV` ≥ 0.5 | 0 | the cursive `a g` substitution (same lookup as `ss01`) |
| both | 0, 1 | both |

This is why `CRSV=1` needs no feature setting: it is a required feature
variation. It also means `ss01` and `CRSV=1` are interchangeable; the axis is
the design intent, the feature is the escape hatch.

### Figures, measured

| | `zero` | `one` | `two` | `three` | … | `1111 0000` |
|---|---|---|---|---|---|---|
| default (proportional) | 1348 | 814 | 1168 | 1156 | | 9394 |
| `tnum` | 1296 | 1296 | 1296 | 1296 | | 10858 (+15.6%) |
| `pnum` | ← identical to default | | | | | 9394 |

Digits are proportional by default, so a column of numbers does not line up
unless you ask for `tnum`. That is the opposite of Roboto Flex, whose default
figures are tabular.

### Not in the font

`smcp c2sc onum lnum zero dlig clig hlig hist titl salt swsh ss02–ss20 cv01–cv99`.
Asking for them does nothing. Small caps, a slashed zero or old-style figures
need a different font.

### Dormant glyphs

16 combining-mark variants and one component are in the font but no feature or
cmap reaches them: `acutecomb/gavecomb/hookabovecomb/tildecomb/uni0302/0304/
0306/0308/030C/030F/0311.narrow`, `uni0304.wide`, `uni030C.alt`,
`uni030C.alt_case`, `uni031B.alt`, `uni031B.alt_case`, `iogonek.dotless`
(plus `NULL`). They were meant for `ccmp` context narrowing (a short caron for
`ď ľ ť`, a narrow acute over narrow letters); the build left that out. **There
are no dormant letter alternates** – nothing in the font could turn `a` into a
different `a` beyond `ss01`.

---

## 3. How to use them

### GTK / pango (font description strings)

Axes go after `@`, comma-separated:

```
Geologica 11                      # wght=400 (pango sets it from the weight)
Geologica Bold Italic 11          # wght=700, slnt=-12, CRSV=1
Geologica 11 @SHRP=100
Geologica 11 @CRSV=1              # upright, cursive a g
Geologica 11 @slnt=-12            # oblique, roman a g
Geologica 11 @wght=550            # any weight, not just the named ones
```

`gsettings set org.gnome.desktop.interface font-name 'Geologica 11 @SHRP=100'`
works, and so do GTK CSS `font:` strings.

### pango markup

```xml
<span font_desc="Geologica 11 @SHRP=100">sharp</span>
<span font_features="ss01">cursive a and g</span>
<span font_features="tnum">1234567890</span>
```

### fontconfig (all pango apps at once)

`fontvariations` must be a **`target="pattern"`** edit; pango ignores it on
`target="font"`. `fontfeatures` works on `target="font"`:

```xml
<match target="pattern">
  <test name="family"><string>Geologica</string></test>
  <edit name="fontvariations" mode="assign"><string>SHRP=100</string></edit>
</match>
<match target="font">
  <test name="family"><string>Geologica</string></test>
  <edit name="fontfeatures" mode="assign_replace">
    <string>tnum</string>
  </edit>
</match>
```

The package's `79-geologica-families.conf` does the first kind for you
(`Geologica Sharp`, `Geologica Semi Sharp`, `Geologica Cursive`).

### CSS (Firefox, Chromium, Electron)

```css
.geologica {
  font-family: "Geologica";
  font-weight: 650;                          /* any value 100-900 */
  font-style: oblique 12deg;                 /* slnt; "italic" also works */
  font-feature-settings: "ss01";             /* cursive a/g, = CRSV 1 */
  font-variation-settings: "SHRP" 100;       /* "CRSV" 1 also works here */
  font-variant-numeric: tabular-nums;        /* tnum */
}
```

`font-style: italic` maps to `slnt=-12` in both browsers but cannot set
`CRSV`, so an italic in a browser keeps the roman `a g`. Add
`font-feature-settings: "ss01"` to get the designer's italic. `oblique 12deg`
is the safer spelling when you want exactly the designed slant.

---

## 4. Coverage

836 code points, 973 glyphs:

| | Count |
|---|---|
| Latin (Basic, Latin-1, Extended-A/B, Extended Additional → Vietnamese) | 494 |
| Greek (monotonic; no Greek Extended/polytonic) | 77 |
| Cyrillic (incl. the BGR/SRB/MKD local forms) | 182 |
| Combining marks | 24 |
| Punctuation, currency, symbols, arrows, math | 59 |

There is no U+0251 (single-storey `ɑ`), no small caps and no letter
alternates other than `ss01`. For a single-storey `a` Inter has `cv11`.
