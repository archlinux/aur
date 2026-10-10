# CLAUDE.md

## Repository Overview

This is the AUR package for [botropolis](https://github.com/Botropolis-City/botropolis) built from the **released binaries**.
[`botropolis`](https://aur.archlinux.org/packages/botropolis) is the same program built from source; the two conflict and either will do.

Prefer this one unless you want to compile, or you want Arch's hardening.
The source package builds with `GOFLAGS="-buildmode=pie"`, so it gets PIE and full RELRO;
upstream's release binaries are non-PIE static builds and `namcap` says so.
That is the one real reason to choose `botropolis` over this package.
The binaries it installs are the ones upstream's CI built and tested — upstream's release workflow publishes what CI produced and rebuilds nothing, so this package ships what was under test rather than a local recompile of it.

## Package-Specific Files

- `checksum.sh`: prints both architectures' checksums, read from the release's own `SHA256SUMS`
- `botropolis.install`: the post-install hint, because three things have to be switched on that a package cannot switch on for you

## Package Maintenance

```bash
# Checksums for a new version (replace X.Y.Z)
./checksum.sh X.Y.Z

# Then bump pkgver, reset pkgrel to 1, and regenerate
makepkg --printsrcinfo > .SRCINFO

# Build and check before committing
makepkg -f
namcap PKGBUILD botropolis-bin-*.pkg.tar.zst
```

`.SRCINFO` must be regenerated and committed with every `PKGBUILD` change, or the AUR will serve stale metadata.

**Both architectures must be bumped together.** `makepkg` on an x86_64 machine never touches `sha256sums_aarch64`, so a wrong aarch64 checksum is invisible here and fails only for the person on that machine.

## Identity

**This repository commits as `Aria Vesta <dev@ariavesta.com>` with SSH signing, set repo-locally.**
The global git identity is a work one, and the older AUR packages in `~/workspaces/aur` use it.
Botropolis is personal, upstream is signed the same way, and a personal package should not carry an employer's domain.

## Architecture

A binary package.
It downloads the release tarball for the building machine's architecture, verifies its sha256, and installs the three binaries, both systemd user units, the desktop entry, the icon, the shell integration, the docs, and the licences for the artwork and typeface compiled into the binaries.

The tarball carries `packaging/` from upstream 0.1.2 onwards, which is what lets this package install the same set as the source one.
Against an earlier tarball it could only have shipped three executables.

`options=('!debug')`, and deliberately **not** `!strip`.

Stripping these is safe and was tested, not assumed: the stripped binaries run, report their version, render a frame headlessly through `dlopen`ed GL, and still symbolise a panic traceback.
Go keeps the traceback's line tables in `.gopclntab` and `dlopen` resolves through `.dynsym`, and `strip --strip-all` touches neither.
It takes the package from 48.7 MB to 33.8 MB.
The sha256sums protect the download, which is what they are for;
stripping happens after that check and does not weaken it.

`namcap`'s PIE and RELRO warnings are the trade-off named at the top, and not fixable here -- they are properties of upstream's build.
It also still calls `botropolisd` and `botropolis-hook` unstripped, and that is correct and expected.
makepkg picks its strip flags from the ELF type: an `EXEC` with a `.dynamic` section gets `--strip-all`, one without gets `--strip-debug`, which drops DWARF but keeps `.symtab`.
`botropolis` links libc so it is dynamic and fully stripped;
the other two are pure static Go binaries and keep their symbol table.
Do not override makepkg to silence those two warnings.

The debug package is the part worth refusing.
It is 14 MB of DWARF with no source to pair it against: `debugedit` cannot read Go's DWARF 5 line tables, so `/usr/src/debug` comes out empty.
The source package produces exactly the same empty result, so `!debug` belongs in both.

The licences go under `/usr/share/licenses/botropolis-bin/` while the docs stay under `/usr/share/doc/botropolis/`.
A licence audit looks beneath the installed package's own name, so `namcap` errors on anything else;
nothing looks for the docs, and the program is called botropolis.

The runtime dependencies are the X11 and GL libraries Ebitengine `dlopen`s.
No linker-based tool can see them — the binaries' only `NEEDED` entry is libc — so `namcap` reports all six as possibly unneeded and all six are needed.
