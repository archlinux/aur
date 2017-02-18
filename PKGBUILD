# Maintainer: Jguer <joaogg3@gmail.com>
pkgname=yay
pkgver=1.101
pkgrel=1
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go."
arch=('i686' 'x86_64' 'arm')
url="https://github.com/Jguer/yay"
license=('GPL')
depends=(
  'sudo'
)
makedepends=(
	'go'
	'git'
)
conflicts=('yay-bin')
source=("yay::git://github.com/jguer/yay.git#branch=${BRANCH:-master}")
md5sums=('SKIP')

pkgver() {
	if [[ "$PKGVER" ]]; then
		echo "$PKGVER"
		return
	fi

	cd "$srcdir/$pkgname"
	local count=$(git rev-list --count HEAD)
	echo "1.${count}"
}

build() {
	cd "$srcdir/$pkgname"

	if [ -L "$srcdir/$pkgname" ]; then
		rm "$srcdir/$pkgname" -rf
		cp -r "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"
	fi

	rm -rf "$srcdir/.go/src"

	mkdir -p "$srcdir/.go/src/github.com/jguer"

	export GOPATH="$srcdir/.go"

	cp -r "$srcdir/$pkgname" "$srcdir/.go/src/github.com/jguer/"

	cd "$srcdir/.go/src/github.com/jguer/$pkgname/cmd/yay"
	ln -sf "$srcdir/.go/src/github.com/jguer/$pkgname/cmd/yay" "$srcdir/$pkgname"

	git submodule update --init

  go get github.com/jguer/go-alpm
  go install -v \
		-gcflags "-trimpath $GOPATH/src" \
		-ldflags="-X main.version=$pkgver"
}

package() {
  #install executable
  install -DT "${srcdir}/.go/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	cd "${srcdir}/.go/src/github.com/jguer/${pkgname}" || exit

  # Install GLP v3
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install manpage
  install -Dm644 yay.8 "${pkgdir}/usr/share/man/man8/yay.8"

  # Install zsh completion
  install -Dm644 "zsh-completion" "${pkgdir}/usr/share/zsh/site-functions/_yay"

  # Install fish completion
  install -Dm644 "yay.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yay.fish"

  # Install bash completion
  install -Dm644 "bash-completion" "${pkgdir}/usr/share/bash-completion/completions/yay"

}
