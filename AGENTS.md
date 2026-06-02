# Agent Instructions

This repository maintains the AUR package `gnome-pomodoro-extension`, based on
the upstream `focustimerhq/FocusTimer` project. Treat it as a packaging
repository: the main project-specific changes should usually be in `PKGBUILD`
and `.SRCINFO`.

## Overview

- `PKGBUILD`: Arch/AUR package recipe.
- `.SRCINFO`: metadata generated from `PKGBUILD`; update it whenever published
  AUR fields change in `PKGBUILD`.
- `src/`, `pkg/`, `*.tar.gz`, and `*.tar.zst`: local build artifacts. Do not edit
  them manually and do not include them in commits.

## Recommended Workflow

1. Read `PKGBUILD` before changing dependencies, version, URL, license, or build
   steps.
2. When updating to a new upstream version:
   - update `pkgver`;
   - keep `pkgrel=1` for a new upstream release;
   - update `source` if the URL format changes;
   - check whether upstream build or runtime dependencies changed and update
     `depends` or `makedepends` in `PKGBUILD` accordingly;
   - run `updpkgsums` to recalculate `sha256sums`;
   - regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`.
3. When changing only the package recipe without changing the upstream version,
   increment `pkgrel`.
4. Validate the package with `makepkg -Csf` when possible.
5. If available, run `namcap PKGBUILD` and `namcap` on the generated package to
   catch common packaging issues.

## Best Practices

- Preserve the simple `PKGBUILD` style: dependency arrays and concise `build()`
  and `package()` functions.
- Prefer official Arch package names for `depends` and `makedepends`.
- Always verify whether dependencies have changed before finishing a package
  update. Compare upstream metadata and build files, then update `PKGBUILD` if
  Arch package dependencies need to be added, removed, or renamed.
- Do not add unnecessary dependencies to work around local failures; first
  confirm whether the dependency is actually required at build time or runtime.
- Do not replace checksums with `SKIP`, except for temporary situations with a
  clear justification.
- Do not edit files inside `src/FocusTimer-*` as if they were permanent source
  code. If an upstream fix is needed, add a versioned patch and apply it from
  `PKGBUILD`.
- Avoid changing generated artifacts. If they appear in `git status`, confirm
  whether they are expected before including anything in a commit.
- Keep `.SRCINFO` synchronized with `PKGBUILD`; drift between them is a common
  source of AUR problems.

## Dependency Review Notes

When updating Focus Timer, inspect the extracted upstream source for dependency
changes before finalizing the package:

- Start with `meson.build` and search for `dependency(`, `find_program(`, and
  Meson feature options. Compare the new release against the previous release.
- Map pkg-config names to Arch package names. For example, `wayland-client` and
  `wayland-scanner` are provided by the Arch `wayland` package.
- If a Meson feature defaults to `enabled` or `auto`, include the required Arch
  dependency when the package should build with that feature enabled by default.
  In the `1.1.2` update, the new Wayland integration made `wayland` necessary.
- Do not add optional validation tools as package dependencies unless the build
  requires them. Examples seen in this project include `desktop-file-validate`,
  `appstreamcli`, and `bash-completion`.
- Keep runtime support packages when upstream still installs data that needs
  them. `dconf` is justified by installed GSettings schemas, and
  `hicolor-icon-theme` is justified by installed icons under `icons/hicolor`.
- If a dependency appears removable, verify both build metadata and installed
  runtime data before removing it from `depends`.

## Useful Commands

```sh
rg "dependency\(|find_program\(|get_option\(" src/FocusTimer-$pkgver -g meson.build
pacman -T glib2 gtk4 libadwaita graphene pango gom libpeas-2 wayland sqlite gstreamer json-glib cairo gobject-introspection dconf hicolor-icon-theme meson vala
updpkgsums
makepkg --printsrcinfo > .SRCINFO
makepkg -Csf
namcap PKGBUILD
namcap gnome-pomodoro-extension-*.pkg.tar.zst
git status --short
```

## Before Finishing

- Check `git diff -- PKGBUILD .SRCINFO AGENTS.md`.
- Make sure `pkgver`, `pkgrel`, `source`, and `sha256sums` are consistent.
- Confirm that `depends` and `makedepends` were reviewed against the current
  upstream release, and update `PKGBUILD` plus `.SRCINFO` if they changed.
- Mention any dependency decision that was not obvious, especially optional
  Meson features that became enabled by default or runtime data packages kept
  intentionally.
- Clearly report which validations were run and which ones could not be run.
