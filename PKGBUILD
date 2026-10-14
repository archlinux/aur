# SPDX-License-Identifier: LGPL-3.0-only
# SPDX-FileCopyrightText: Copyright (C) 2026 mplx <jennifer@mplx.dev>
#
# AUR PKGBUILD for `jennifer-git`: clones the upstream repository and builds
# from source. Tracks the `main` branch; rebuild to follow upstream.
#
# Both binaries are built via `make build`: the standard-Go `jennifer` (always)
# and the TinyGo `jennifer-tiny` (only when the toolchain can produce it).
# `make build` probes the toolchain and skips `jennifer-tiny` when TinyGo cannot
# build it; package() then installs the tiny binary, its man page, and its
# completion symlink only when it exists. So the package ships whatever was built
# and needs no edit to flip tiny on or off.
#
# Today `jennifer-tiny` is skipped: Arch ships Go 1.27, and no current TinyGo
# release links Jennifer against it. TinyGo 0.42 accepts Go 1.27 but the
# `-scheduler=tasks` link fails with a duplicate `tinygo_task_exit` symbol
# (`//export` in TinyGo's internal/task/task_stack.go, emitted into both the
# cached runtime object and the program object); it reproduces on the official
# `tinygo/tinygo:0.42.0` image and on `tinygo/tinygo-dev` (0.43.0-dev), even on a
# trivial goroutine program - an upstream TinyGo bug, not Arch packaging or
# Jennifer's code. Tracked at https://github.com/tinygo-org/tinygo/issues/5652.
# When a TinyGo release fixes it, `make build` starts producing `jennifer-tiny`
# again and this package ships it automatically - no PKGBUILD change needed.
#
# Maintainer: mplx <jennifer@mplx.dev>

pkgname=jennifer-git
_realname=jennifer
pkgver=0.24.0.r106.gf159b5d
pkgrel=1
pkgdesc='Jennifer programming language interpreter (built from source)'
arch=('x86_64' 'aarch64')
url='https://github.com/jennifer-language/jennifer'
license=('LGPL3')
provides=('jennifer')
conflicts=('jennifer' 'jennifer-bin')
# `tinygo` is a makedepend so `make build` can produce `jennifer-tiny` whenever
# the toolchain supports it. On current Arch (Go 1.27) TinyGo cannot build it, so
# the build skips it and only `jennifer` is packaged; the dep stays so recovery
# is automatic once upstream (tinygo#5652) ships. Drop `tinygo` here for a lighter
# source build that never produces the tiny binary.
makedepends=('git' 'go' 'tinygo')
optdepends=(
    'shared-mime-info: registers the .j file extension with file managers'
    'vim: syntax highlighting for .j files'
    'bat: syntax highlighting for .j files (run `bat cache --build` after install)'
)
install='jennifer.install'
source=("$_realname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_realname"
    # Format: <last-tag-without-v>.r<commits-since>.g<short-sha>
    # Sortable per Arch's vercmp; matches the AUR -git convention.
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g' \
        || printf 'r%s.%s' \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_realname"
    # -trimpath drops the local $srcdir path from the binary (makepkg flags a
    # $srcdir reference otherwise); the plain dev `make build` keeps symbols,
    # so the packaged build asks for the release flag explicitly.
    #
    # `make build` builds the standard-Go `jennifer` and, when the toolchain can,
    # the TinyGo `jennifer-tiny`; it skips the tiny half gracefully otherwise (see
    # the header note / tinygo#5652), so this never fails for lack of a working
    # TinyGo. package() installs whichever binaries were produced.
    make build GOBUILDFLAGS=-trimpath
}

check() {
    cd "$srcdir/$_realname"
    go test ./...
}

package() {
    cd "$srcdir/$_realname"

    # Binaries. `jennifer-tiny` installs only when `make build` produced it (the
    # TinyGo build is skipped when the toolchain can't build it - see the header).
    install -Dm755 jennifer      "$pkgdir/usr/bin/jennifer"
    if [[ -f jennifer-tiny ]]; then
        install -Dm755 jennifer-tiny "$pkgdir/usr/bin/jennifer-tiny"
    fi

    # Man pages, gzipped. The jennifer-tiny.1 page ships only when its binary did.
    install -Dm644 packaging/man/jennifer.1      "$pkgdir/usr/share/man/man1/jennifer.1"
    gzip -9n "$pkgdir/usr/share/man/man1/jennifer.1"
    if [[ -f jennifer-tiny ]]; then
        install -Dm644 packaging/man/jennifer-tiny.1 "$pkgdir/usr/share/man/man1/jennifer-tiny.1"
        gzip -9n "$pkgdir/usr/share/man/man1/jennifer-tiny.1"
    fi

    # XDG MIME info for the .j extension.
    install -Dm644 packaging/mime/jennifer.xml \
        "$pkgdir/usr/share/mime/packages/jennifer.xml"

    # Bash completion. jennifer-tiny symlinks to the same script when present.
    install -Dm644 packaging/completions/jennifer.bash \
        "$pkgdir/usr/share/bash-completion/completions/jennifer"
    if [[ -f jennifer-tiny ]]; then
        ln -sf jennifer "$pkgdir/usr/share/bash-completion/completions/jennifer-tiny"
    fi

    # Vim / Neovim syntax highlighting, so `.j` files highlight with no user
    # setup. Vim and Neovim read separate runtimepaths (/usr/share/vim/vimfiles
    # vs /usr/share/nvim/site), so install a copy under each.
    install -Dm644 editors/vim/syntax/jennifer.vim \
        "$pkgdir/usr/share/vim/vimfiles/syntax/jennifer.vim"
    install -Dm644 editors/vim/ftdetect/jennifer.vim \
        "$pkgdir/usr/share/vim/vimfiles/ftdetect/jennifer.vim"
    install -Dm644 editors/vim/syntax/jennifer.vim \
        "$pkgdir/usr/share/nvim/site/syntax/jennifer.vim"
    install -Dm644 editors/vim/ftdetect/jennifer.vim \
        "$pkgdir/usr/share/nvim/site/ftdetect/jennifer.vim"

    # Sublime Text / bat syntax. bat compiles syntaxes into a per-user cache,
    # so it can't auto-activate from here; the user copies it to
    # `$(bat --config-dir)/syntaxes/` and runs `bat cache --build`.
    install -Dm644 editors/sublime/jennifer.sublime-syntax \
        "$pkgdir/usr/share/jennifer/syntaxes/jennifer.sublime-syntax"

    # Jennifer-coded library modules: bare `import "name.j";` resolves under the
    # system module directory. Ship the modules and their include-partials, not
    # the *_test.j overlays (development-only).
    install -dm755 "$pkgdir/usr/share/jennifer/modules"
    for m in modules/*.j; do
        [[ "$m" == *_test.j ]] && continue
        install -m644 "$m" "$pkgdir/usr/share/jennifer/modules/"
    done

    # Language reference for coding assistants (also a human quick-reference).
    install -Dm644 JENNIFER.md "$pkgdir/usr/share/doc/jennifer/JENNIFER.md"
}
