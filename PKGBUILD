# Maintainer: Luke Cotton <aur at cotton dot org dot uk>
_pkgname='unbted'
pkgname="${_pkgname}-git"
pkgver=1.2.1.r1.ga2bd934
pkgrel=1
pkgdesc="Una's NBT Editor - an advanced interactive command-line NBT editor"
arch=('any')
url="https://git.sleeping.town/unascribed/${_pkgname}"
license=('GPL-3.0-only' 'Apache-2.0' 'MIT')
groups=()
depends=()
makedepends=('git' 'gradle<9' 'java-environment<=17')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=(
	"git+https://github.com/unascribed/${_pkgname}.git"
	"${_pkgname}.sh"
)
noextract=()
sha256sums=(
        'SKIP'
        '56665e9227b213bd42fe7cffb5c955a55ab4ceb2573aeb8b84eda7a54a73945d'
)

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags --abbrev=7 | sed -e 's|^v||;s|\([^-]*-g\)|r\1|;s|-|.|g'
}

build() {
	cd "$srcdir/$_pkgname"
	# Suppress Gradle's welcome message on first build
	gradle --version > /dev/null
	gradle build
}

package() {
	depends=('java-runtime>=17' 'sh')
	_gittag="$(echo ${pkgver} | sed -e 's|^\([0-9]*\.[0-9]*\.[0-9]*\).*|\1|')"
	install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	cd "${srcdir}/${_pkgname}"
	install -Dm644 "build/libs/${_pkgname}-${_gittag}.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
	install -Dm644 "opennbt-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/MIT"
}

