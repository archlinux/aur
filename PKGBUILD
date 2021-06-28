# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kakoune.cr-git
_reponame=kakoune.cr
pkgver=r145.4f86083
pkgrel=1
pkgdesc='command-line tool for Kakoune'
arch=(x86_64)
url="https://github.com/alexherbo2/kakoune.cr"
license=(Unlicense)
depends=(jq)
makedepends=(git crystal shards llvm asciidoctor)
optdepends=('fzf:     fzf integration'
            'bat:     fzf integration'
            'fd:      fzf integration'
            'ripgrep: fzf integration')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_reponame"
	make build

	asciidoctor -b manpage share/kcr/pages/*.asciidoc
}

package() {
	cd "$srcdir/$_reponame"
	# 'make install' installs stuff into user's home directory so we do the packaging ourselfs
	install -Dm755 -t "$pkgdir/usr/bin/" bin/kcr share/kcr/commands/*/kcr-*
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/kcr/pages" share/kcr/pages/tldr.txt
	install -Dm644 -t "$pkgdir/usr/share/man/man1/" share/kcr/pages/*.1
	install -Dm644 -t "$pkgdir/usr/share/kcr/init" share/kcr/init/*
	install -Dm644 -t "$pkgdir/usr/share/kcr/rc" share/kcr/rc/*
	install -Dm644 -t "$pkgdir/usr/share/applications" share/kcr/applications/kcr.desktop
	install -dm755 "$pkgdir/usr/share/kak/rc/addons"
	ln -sf /usr/share/kcr/init/kakoune.kak "$pkgdir/usr/share/kak/rc/addons/kakoune.cr.kak"
}
