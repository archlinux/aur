# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=craigderington
_pkgname=skyterm
pkgname=${_pkgname}
pkgdesc="A terminal-based astronomy application"

pkgver=0.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${pkgname}")
makedepends=('go')
depends=('glibc')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('57634c60f9f6222fc56908e1141f54b8450cc7e68815889aa139896577a58ca1')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	mkdir -p "./cmd/${pkgname}"

	echo """
package main

import (
	\"fmt\"
	\"os\"

	tea \"github.com/charmbracelet/bubbletea\"
	\"github.com/craigderington/skyterm/internal/app\"
)

func main() {
	p := tea.NewProgram(
		app.New(),
		tea.WithAltScreen(),
		tea.WithMouseCellMotion(),
	)

	if _, err := p.Run(); err != nil {
		fmt.Printf(\"Error: %v\n\", err)
		os.Exit(1)
	}
}
	""" > "./cmd/${pkgname}/main.go"
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o ${pkgname} "./cmd/${pkgname}"
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
