## 17-05-2020 VERSION 1.9.2

- Add: text wrap mappings can now be prefixed with a _count_ :tada: ([#103](../../issues/103) by @victorkristof)
- Add: ability to **toggle** bold / italic / strikethrough / inline-code / link wrapping ([#101](../../issues/101) by @victorkristof)
- Add: enhanced versions of <kbd>g</kbd><kbd>f</kbd> and <kbd>g</kbd><kbd>x</kbd> and [`g:mkdx#settings.gf_on_steroids`](#gmkdxsettingsgf_on_steroids) ([#100](../../issues/100) by @victorkristof and @samarulmeu)
- Add: support YAML frontmatter
- Add: ability to create multi-paragraph quotes
- Add: toggling a quote with a multi-line selection no longer skips empty lines ([#94](../../issues/94) by @samarulmeu)
- Add: toggling code will now toggle a code-block instead when in `V`isual-linewise mode ([#93](../../issues/93))
- Add: [CriticMarkup](http://criticmarkup.com/) highlighting
- Fix: no-op folding functions when `g:markdown_folding` is enabled
- Fix: allow mkdx to work with [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown) enabled
- Fix: insertion of double quote marks on <kbd>enter</kbd>
- Fix: removed duplicate helptag causing Vundle to crash ([#92](../../issues/92) by @samarulmeu)
- Fix: `<details />` TOC not unindenting properly when `&sw` is `0`
- Fix: typo in README ([#88](../../issues/88) by @Ginner)

## 10-05-2019 VERSION 1.9.1

- Fix: Handle non-ascii characters in header (TOC) links ([#85](../../pull/85) by @totpet)

## 23-11-2018 VERSION 1.9.0

- Add: Table of contents supports configurable nested details tags
- Add: [g:mkdx#settings.toc.details.nesting_level](#gmkdxsettingstocdetailsnesting_level) to control nested details generation
- Add: [g:mkdx#settings.toc.details.child_count](#gmkdxsettingstocdetailschild_count) to control after how many children a nested details tag will appear
- Add: [g:mkdx#settings.toc.details.child_summary](#gmkdxsettingstocdetailschild_summary) to control summary text inside nested details

## 20-11-2018 VERSION 1.8.3

- Fix: handle unicode characters in list items ([#80](../../issues/80))
- Fix: handle unicode characters in CSV ([#81](../../issues/81))

## 13-11-2018 VERSION 1.8.2

- Fix: handle `&shiftwidth = 0` (Thanks to [@marcdeop](https://github.com/marcdeop))

## 09-09-2018 VERSION 1.8.1

- Add: Mkdx can convert tables [back to CSV](#convert-csv-to-table-and-back)
- Fix: Only open quickfix when broken links are present([#56](../../pull/56))
- Fix: Table highlighting now stops at the end of a table ([#57](../../pull/57))
- Fix: Empty cells in CSV also get a border ([#61](../../pull/61))
- Fix: All `hasmapto` calls are mode specific ([#64](../../pull/64))
- Fix: `g:mkdx#settings.restore_visual` can now be disabled during runtime ([#65](../../pull/65))
- Fix: Wrapping at end of line no longer breaks when line ends with non word characters ([#67](../../pull/67))
- Fix: No longer pollute register when updating table of contents ([#68](../../issues/68))
- Fix: Empty setex-style headers are no longer added to quickfix headers or the table of contents ([#69](../../issues/69))
- Fix: Always empty quickfix list before showing dead links ([#70](../../issues/70))

## 03-08-2018 VERSION 1.8.0

- Add: Setting to control updating TOC before writing the buffer ([#54](../../pull/54))
- Fix: Unable to position TOC as last header ([#53](../../pull/53))

## 30-07-2018 VERSION 1.7.1

- Add: Pressing <kbd>enter</kbd> after an inline list item creates a new list item instead of a blank line

## 24-06-2018 VERSION 1.7.0

- Add: Support Setex style headings (`-` / `=` characters below nonblank line)
- Add: Support Setex style headings in completion menu
- Add: Support Setex style headings in TOC generation
- Add: Support Setex style headings in header listing
- Add: [Setting](#gmkdxsettingstokensstrike) to allow customizing strikethrough style ([#49](../../pull/49))
- Fix: TOC without any nested elements created too many closing tags when generated using `<details>` tag
- Fix: Non-list items sometimes got detected as list items when starting with a number on <kbd>shift</kbd>+<kbd>O</kbd>
- Fix: overriding `g:mkdx#settings` with `has('*dictwatcheradd')` crashing Vim

## 14-05-2018 VERSION 1.6.1

- Add: Highlighting for tables ([#42](../../pull/42)), `<kbd>` shortcuts and `_**bolditalic**_` ([#43](../../pull/43)).
- Add: [<kbd>shift</kbd>+<kbd>enter</kbd>](#inserting-list-items) support to create multiline items ([#44](../../pull/43)).
- Fix: <kbd>shift</kbd>+<kbd>enter</kbd> no longer require double <kbd>escape</kbd> to exit insert mode ([#45](../../pull/45)).
- Fix: Dead link detection, incorrect external label and relative links were [always skipped](https://github.com/SidOfc/mkdx/commit/f3c5d2884237dba1b97d915f3d80e03317877a18).
- Fix: `grep` and `ggrep` do not count line column properly (byte-offset is converted now).

## 10-05-2018 VERSION 1.6.0

- Fix: Handle URLS starting with "../../" correctly.
- Fix: Removed hardcoded hashtag as header identifier in function.
- Fix: ([#35](../../pull/35)) Generating a TOC in the details didn't generate the final closing tags.
- Fix: ([#40](../../pull/40)) Shift-o (`O`) prepending a list item to a line starting with a number.
- Fix: ([#39](../../pull/39)) Set `autoindent`, it is enabled by default in Neovim but disabled by default in Vim.
- Add: ([#41](../../pull/41)) Fold support for the table of contents and fenced code blocks (opt-in).
    - Add setting to enable folding: `g:mkdx#settings.fold.enable = 0`.
    - Add setting to modify what is folded: `g:mkdx#settings.fold.components = ['toc', 'fence']`.
- NEOVIM
    - Add: ([#32](../../pull/32)) `dictionarywatcher` that watches settings and immediately updates the document, this includes:
        - TOC text - (`:let g:mkdx#settings.toc.text = 'string'`).
        - TOC position - (`:let g:mkdx#settings.toc.position = 2`).
        - TOC style - (`:let g:mkdx#settings.toc.details.enable = 1`).
        - TOC summary - (`:let g:mkdx#settings.toc.details.summary = 'new string'`).
        - Header style - (`:let g:mkdx#settings.tokens.header = '@'`).
        - Fence style - (`:let g:mkdx#settings.tokens.fence = '~'`).
        - Folds - (`:let g:mkdx#settings.tokens.components = ['toc']`).
    - Add: setting to control auto-updates: `g:mkdx#settings.auto_update.enable = 1`.

## 05-05-2018 VERSION 1.5.1

- [dead link detection](#dead-link-detection) uses a [grep program](#supported-grep-programs) and `job` when available
- [jumping to headers](#jump-to-header) uses a [grep program](#supported-grep-programs) and `job` when available
- [insert autocompletion](#insert-mode-fragment-completion) uses a [grep program](#supported-grep-programs) and `job` when available

## 28-04-2018 VERSION 1.5.0

- Add insert mode completion for [fragment links](#insert-mode-fragment-completion).
- Add [setting](#gmkdxsettingslinksfragmentcomplete) to control completions.
- Add support for anchor fragment links ([#24](../../issues/24)) (`<a id="hello"></a>` / `<a name="hello"></a>`) for [jumping](#jump-to-header), [detection](#dead-link-detection) and [completion](#insert-mode-fragment-completion).
- Fix issue where double slashes in the URL would not be removed in external link checks.
- Fix nested `<a></a>` tags in generated TOC links.

## 27-04-2018 VERSION 1.4.3

- ([#17](../../issues/17)) Add a mapping to go to [fragment link location](#jump-to-header).
- ([#18](../../issues/18)) Add [alignment options](#gmkdxsettingstablealign) for columns in a table generated from CSV.
- ([#18](../../issues/18)) Add [alignment options](#gmkdxsettingstablealign) for specific column names or indexes in a table generated from CSV.
- List items require a space after them to be recognized as a list item.

## 15-04-2018 VERSION 1.4.2

- [Convert CSV to table](#convert-csv-to-table) now also supports quoted CSV and TSV data

## 08-04-2018 VERSION 1.4.1

- [Dead link detection](#dead-link-detection) will now also scan any `href=""` attribute content.

## 08-04-2018 VERSION 1.4.0

- Update [Dead link detection](#dead-link-detection) to include support for external and relative links.
- Add [new settings](#gmkdxsettingslinksexternalenable) to control request timeout and relative link host etc.

## 02-04-2018 VERSION 1.3.0

- Added feature: [Dead fragment link detection](#dead-link-detection)
- Automatically remove `r` from `formatoptions` inside markdown files (buffer local override)
- Fix table of contents "eating" a header when there is no blank line between the table of contents and the next heading
- Cursor stays on the same line after updating table of contents
- `mkdx#QuickfixHeaders()` shows amount of headers and doesn't open quickfix when no headers are present.

## 01-04-2018 VERSION 1.2.0

- Added feature: Support generating [table of contents inside `<details>` tag](#generate-or-update-toc-as-details).

## 31-03-2018 VERSION 1.1.0

- Stricter rules for highlighting (do not highlight bold markers at start of line as list items).
- Fix TOC links using headings containing <kbd /> tags.
- Fix deep merging of `g:mkdx#settings` hash.
- Add setting to place TOC in fixed position.

## 25-03-2018 VERSION 1.0.2

- Fix incorrect <Plug> mapping detection
- Update README, add remapping section

## 24-03-2018 VERSION 1.0.1

- All mappings now use `<Plug>`.

## 24-03-2018 VERSION 1.0.0

- Fix #11 - `mkdx#ToggleQuote` inserting `0` on empty lines
- Fix #12 - Update (task-)lists inside a quote
- Fix #13 - Add / remove (task-)lists inside a quote
- Add `<Plug>(mkdx-o)` in favor of directly mapping to `A<Cr>` to trigger `mkdx#EnterHandler`
- Add `<Plug>(mkdx-shift-o)` in favor of directly mapping to `:call mkdx#ShiftOHandler()<Cr>`

## 28-01-2018 VERSION 0.9.0

- Fix `mkdx#HeaderToQF` wrong function ref.
- Fix `g:mkdx#settings.enter.enable` and `g:mkdx#settings.enter.shifto` can be disabled during runtime.
- Fix insert mode "\~\~\~" and "\`\`\`" recursion.
- Add support for [toggling \<kbd /> shortcuts](#toggling-kbd--shortcuts) in normal and visual mode.

## 21-01-2018 VERSION 0.8.0

- Fix some issues with `mkdx#WrapLink`.
- `mkdx#WrapLink` handles selections that include newline character correctly.
- Headers can now also be toggled on / off using `mkdx#ToggleHeader`.
- When deleting a list item anywhere in the list, following list items are decremented by 1.
- Added more tests for
    - decrementing list items
    - promoting / demoting headers
    - Wrapping links and images

## 13-01-2018 VERSION 0.7.1

Add support for <kbd>shift</kbd>+<kbd>O</kbd> in addition to <kbd>enter</kbd> and <kbd>O</kbd> in normal mode.
This will put your cursor on a new empty list item above the current line.

## 13-01-2018 VERSION 0.7.0

Add menu support in terminal vim and gvim if it `:has('menu')`.

## Version 0.6.1

Fixes a bug where wrapping text on a line with a single word would cause a space to be prepended.
Imagine the cursor is the pipe character (`|`) in this line: `w|ord`, [wrapping as a link](#as-a-link)
would cause the following result:

~~~
# this
word
 [word](|)

# now becomes this
word
[word](|)
~~~

## Version 0.6.0

- This version adds _opt-in_ support for checkbox state highlighting. See [`g:mkdx#settings.highlight.enable`](#gmkdxsettingshighlightenable) for more information.

## Version 0.5.0

- This version introduces a mapping that opens a quickfix window with all your headers loaded.
  See [Open TOC in quickfix window](open-toc-in-quickfix-window) section for an example.

## Version 0.4.3.1

- Fixes a critical issue with the enter handler functionality where often, it would crash due to missing out of bounds
array check.

