## Unreleased

#### Additions

#### Changes

#### Removals

#### Fixes

## v3.4.3

#### Changes

- Removed built-in `namedtuple` `defaults` parameter.

## v3.4.2

#### Changes

- Updated `wrapio` requirement.

## v3.4.1

#### Fixes

- Fixed clean bracket regex.

## v3.4.0

#### Additions

- Windows 10 support (Anniversary Update and up).

#### Fixes

- Fixed ignored sequence detection.

## v3.3.0

#### Additions

- Added `numeric`.

#### Changes

- Moved `confirm` hint default closer to input.

#### Fixes

- Included more docs about omitting `hint`.

## v3.2.4

#### Fixes

- Deletions now work for `input` with `multi=False`.

## v3.2.3

#### Fixes

- `traverse` accepts `trail` rather than its first element (just as docs imply).
- Allow moving back with non-empty `traverse` trail.

## v3.2.2

#### Changes

- `check` now accounts for `default`.

## v3.2.1

#### Fixes

- Actually return default on empty responses.

## v3.2.0

#### Additions

- Added `default` for `input` and its children.

## v3.1.1

#### Changes

- `select`\'s `index` now moves focus *by* instead of *to* whatever it's set.

#### Fixes

- Passing `callback` no longer breaks everything.

## v3.1.0

#### Additions

- `alt+left` and `alt+right` move the cursor after the next special rune.

#### Changes

- Cursor moves at the end of editors' initial `value` by inserting.

#### Fixes

- Fixed `traverse`\'s `jump` doc.

## v3.0.2

- Tab now triggers an insert event.

#### Fixes

## v3.0.2

#### Fixes

- Updated version to reflect breaking changes.

## v3.0.1

#### Fixes

- `jump` now takes proper arguments in `path`.

## v3.0.0

#### Additions

- Added `note`: A symbol coming before `prompt`.
- Added `info`: Updatable text coming after `prompt` and before `hint`.
- Added `indent` for `MultiLineEditor`: The amount of spaces for each tab.
- Added `jump` in `traverse`: A function deciding which index tab advances to.
- Added `Theme`: A data-like class used by `use` to overwrite global behavior.
- Added `auto` argument in almost every routine. Used to determine whether to respond immediately.

#### Changes

- Renamed modules and moved around classes to more specific places.
- Revamped `api.py` and modules around it to better house new features.
- `hint` is now static and cannot be updated. Use `info` instead.
- Exposed `respond` for when `auto` is `False`.
- Updated documentation to match new changes.

#### Removals

- Removed the `view`, `color` and `erase` from every routine in favor of `auto`.
- Removed `utils.py` as hints are now made directly via routines in `core.py`.

#### Fixes

- `helpers.paint` now accommodates more cases of ANSI-SGR sequence injecting.

## v2.1.6

#### Fixes

- \#8 inconsistent coloring of the default hint for `confirm`
- Installing through Github and release assets should now work.

## v2.1.5

#### Fixes

- AttributeError during version parsing in `setup.py`.

## v2.1.4

#### Changes

- README syntax is not RST.

## v2.1.3
