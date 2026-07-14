# SPDX-License-Identifier: LGPL-3.0-only
# Copyright (C) 2026 <developer@mplx.eu>
#
# AUR PKGBUILD for `jennifer-git`: clones the upstream repository
# and builds both binaries (`jennifer` standard Go + `jennifer-tiny`
# TinyGo) from source. Tracks the `main` branch; rebuild to
# follow upstream.
#
# Maintainer: developer@mplx.eu <developer@mplx.eu>

pkgname=jennifer-git
_realname=jennifer
pkgver=0.17.0.r0.g0000000
pkgrel=1
pkgdesc='Jennifer programming language interpreter (built from source)'
arch=('x86_64' 'aarch64')
url='https://github.com/mplx/jennifer-lang'
license=('LGPL3')
provides=('jennifer')
conflicts=('jennifer' 'jennifer-bin')
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
    make build
}

check() {
    cd "$srcdir/$_realname"
    go test ./...
}

package() {
    cd "$srcdir/$_realname"

    # Binaries.
    install -Dm755 jennifer      "$pkgdir/usr/bin/jennifer"
    install -Dm755 jennifer-tiny "$pkgdir/usr/bin/jennifer-tiny"

    # Man pages.
    install -Dm644 packaging/man/jennifer.1      "$pkgdir/usr/share/man/man1/jennifer.1"
    install -Dm644 packaging/man/jennifer-tiny.1 "$pkgdir/usr/share/man/man1/jennifer-tiny.1"
    gzip -9n "$pkgdir/usr/share/man/man1/jennifer.1"
    gzip -9n "$pkgdir/usr/share/man/man1/jennifer-tiny.1"

    # XDG MIME info for the .j extension.
    install -Dm644 packaging/mime/jennifer.xml \
        "$pkgdir/usr/share/mime/packages/jennifer.xml"

    # Bash completion (jennifer-tiny symlinks to it).
    install -Dm644 packaging/completions/jennifer.bash \
        "$pkgdir/usr/share/bash-completion/completions/jennifer"
    ln -sf jennifer "$pkgdir/usr/share/bash-completion/completions/jennifer-tiny"

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

    # Language reference for coding assistants (also a human quick-reference).
    install -Dm644 JENNIFER.md "$pkgdir/usr/share/doc/jennifer/JENNIFER.md"
}
