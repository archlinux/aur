# SPDX-License-Identifier: LGPL-3.0-only
# SPDX-FileCopyrightText: Copyright (C) 2026 mplx <jennifer@mplx.dev>
#
# AUR PKGBUILD for `jennifer-bin`: downloads the prebuilt release
# tarball and installs both binaries (`jennifer` standard Go +
# `jennifer-tiny` TinyGo) side by side. Pair to `jennifer-git`
# which builds from source.
#
# Maintainer: mplx <jennifer@mplx.dev>

pkgname=jennifer-bin
_realname=jennifer
pkgver=0.24.0
pkgrel=1
pkgdesc='Jennifer programming language interpreter (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/jennifer-language/jennifer'
license=('LGPL3')
provides=('jennifer')
conflicts=('jennifer' 'jennifer-git')
optdepends=(
    'shared-mime-info: registers the .j file extension with file managers'
    'vim: syntax highlighting for .j files'
    'bat: syntax highlighting for .j files (run `bat cache --build` after install)'
)
install='jennifer.install'
source_x86_64=("$_realname-$pkgver-linux-amd64.tar.gz::$url/releases/download/$pkgver/$_realname-$pkgver-linux-amd64.tar.gz")
source_aarch64=("$_realname-$pkgver-linux-arm64.tar.gz::$url/releases/download/$pkgver/$_realname-$pkgver-linux-arm64.tar.gz")

# The release pipeline writes a sidecar .sha256 for each tarball;
# update these on each release. AUR maintainer note: replace SKIP
# with the real sums when you bump pkgver. CI publishes a
# pre-filled PKGBUILD-bin as a release asset; copy from there.
sha256sums_x86_64=('fe642f8aec93c9bcaaeac297c709e015356eb2bcb865ddebdc2d9bf1afe4fe66')
sha256sums_aarch64=('abf184412b76a5124993ea10ea7951e9a20191928d6729aece33364751fd26ec')

# The release tarball lays out as `jennifer-X.Y.Z-linux-ARCH/` with
# both binaries at the top of that directory.
_srcdir_x86_64="$_realname-$pkgver-linux-amd64"
_srcdir_aarch64="$_realname-$pkgver-linux-arm64"

package() {
    # Determine the source directory from the running arch.
    case "$CARCH" in
        x86_64)  _srcdir="$_srcdir_x86_64" ;;
        aarch64) _srcdir="$_srcdir_aarch64" ;;
        *)
            echo "PKGBUILD: unsupported arch $CARCH" >&2
            return 1
            ;;
    esac

    cd "$srcdir/$_srcdir"

    # Binaries.
    install -Dm755 jennifer      "$pkgdir/usr/bin/jennifer"
    install -Dm755 jennifer-tiny "$pkgdir/usr/bin/jennifer-tiny"

    # Man pages (already gzipped by the release pipeline would be nice;
    # we gzip here for the AUR package so the per-arch tarball stays
    # universally consumable).
    install -Dm644 share/man/man1/jennifer.1      "$pkgdir/usr/share/man/man1/jennifer.1"
    install -Dm644 share/man/man1/jennifer-tiny.1 "$pkgdir/usr/share/man/man1/jennifer-tiny.1"
    gzip -9n "$pkgdir/usr/share/man/man1/jennifer.1"
    gzip -9n "$pkgdir/usr/share/man/man1/jennifer-tiny.1"

    # XDG MIME info for the .j extension.
    install -Dm644 share/mime/packages/jennifer.xml \
        "$pkgdir/usr/share/mime/packages/jennifer.xml"

    # Bash completion (jennifer-tiny symlinks to it).
    install -Dm644 share/bash-completion/completions/jennifer \
        "$pkgdir/usr/share/bash-completion/completions/jennifer"
    ln -sf jennifer "$pkgdir/usr/share/bash-completion/completions/jennifer-tiny"

    # Vim / Neovim syntax highlighting, so `.j` files highlight with no user
    # setup. Vim and Neovim read separate runtimepaths (/usr/share/vim/vimfiles
    # vs /usr/share/nvim/site), so install a copy under each.
    install -Dm644 share/vim/vimfiles/syntax/jennifer.vim \
        "$pkgdir/usr/share/vim/vimfiles/syntax/jennifer.vim"
    install -Dm644 share/vim/vimfiles/ftdetect/jennifer.vim \
        "$pkgdir/usr/share/vim/vimfiles/ftdetect/jennifer.vim"
    install -Dm644 share/vim/vimfiles/syntax/jennifer.vim \
        "$pkgdir/usr/share/nvim/site/syntax/jennifer.vim"
    install -Dm644 share/vim/vimfiles/ftdetect/jennifer.vim \
        "$pkgdir/usr/share/nvim/site/ftdetect/jennifer.vim"

    # Sublime Text / bat syntax. bat compiles syntaxes into a per-user cache,
    # so it can't auto-activate from here; the user copies it to
    # `$(bat --config-dir)/syntaxes/` and runs `bat cache --build`.
    install -Dm644 share/jennifer/syntaxes/jennifer.sublime-syntax \
        "$pkgdir/usr/share/jennifer/syntaxes/jennifer.sublime-syntax"

    # Jennifer-coded library modules: bare `import "name.j";` resolves under the
    # system module directory. The release tarball already excludes the
    # *_test.j overlays, so a plain glob is safe.
    install -dm755 "$pkgdir/usr/share/jennifer/modules"
    install -m644 share/jennifer/modules/*.j "$pkgdir/usr/share/jennifer/modules/"

    # Language reference for coding assistants (also a human quick-reference).
    install -Dm644 JENNIFER.md "$pkgdir/usr/share/doc/jennifer/JENNIFER.md"
}
