# Maintainer: Virt <virtinstance@gmail.com>

pkgname=jemula802-git
pkgver=r223.4086c28
pkgrel=3
pkgdesc='Emulation software to model 802.11 and other 802 wireless communication systems.'
arch=(any)

url='https://bitbucket.org/lfield/jemula802'
license=(BSD)

depends=('java-runtime')
makedepends=('ant' 'java-environment')

source=("git+https://bitbucket.org/lfield/jemula802.git"
        "git+https://bitbucket.org/lfield/jemula.git"
        "ant-jar-jemula.patch"
        "ant-jar-jemula802.patch"
        "model-directory.patch"
        "jemula802.sh")

sha256sums=('SKIP'
            'SKIP'
            'd377f54b3283e75b0b6ec10295619920534d4b473f7063bd44845f5472e2eadf'
            'f8ccc41d5c6b01d84ebc8dd4fe966ea1b9d7eed59f44ab06b197264dce66db0b'
            'e0d01e3b3aeb5efb556772b038e41a91de6217db3a533a03232f65d0606a2ac4'
            'bcebdb3dff9e0ba1e8b758ccd7f3d213042047b24b14a200c673c0b5974f8fba')

pkgver() {
	cd "$srcdir"/jemula802
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"/jemula
	git apply < "$srcdir/ant-jar-jemula.patch"

	cd "$srcdir"/jemula802
	git apply < "$srcdir/ant-jar-jemula802.patch"
	git apply --ignore-space-change --ignore-whitespace < "$srcdir/model-directory.patch" # fucking line endings
	
	ant -Djemula="$srcdir/jemula"
}

package() {
	cd "$srcdir"/jemula802

	install -Dm644 dist/jemula802.jar "$pkgdir"/usr/share/java/jemula802/jemula802.jar
	install -Dm644 resources/models/* -t "$pkgdir"/usr/share/jemula802/models/

	install -Dm755 ../jemula802.sh "$pkgdir"/usr/bin/jemula802
}
