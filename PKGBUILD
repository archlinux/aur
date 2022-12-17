# Maintainer: Sematre <sematre at gmx dot de>
pkgname=mimaflux-git
pkgver=1.1.0.r10.gbb200f4
pkgrel=1

pkgdesc='Debugger for Mima assembly code.'
url='https://github.com/mattulbrich/mimaflux'
license=('GPL3')
arch=('any')

depends=('java-runtime>=16')
makedepends=('git' 'gradle')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+${url}.git"
        "run-mimaflux.sh"
        "mimaflux.desktop")
sha256sums=('SKIP'
            '5759139eef0a25c97833bd250f4382212cd3ca36ffb9ef556d9f0b31ef233636'
            'aeb78a49996f512c450d48b790b3d73036a962ea4d1479d2576001648e2f96ab')

pkgver() {
	cd "${pkgname%-git}"

	# Upstream uses inconsistent versioning schema for git tags and gradle build.
	# The version will be read from the build.gradle file instead.
	project_version=$(grep -E '^version' build.gradle | cut -c 10- | rev | cut -c 2- | rev)
	git_hash=$(git describe --long --tags | sed 's/v[0-9]\+\.[0-9]\+//;s/-/.r/;s/-/./')
	echo "${project_version}${git_hash}"
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	gradle --no-daemon shadowJar
}

package() {
	cd "${srcdir}/${pkgname%-git}"

	# Executable	
	install -Dm644 "build/libs/mimaflux-${pkgver%.*.*}-all.jar" "${pkgdir}/usr/share/java/${pkgname%-git}/${pkgname%-git}.jar"
	install -Dm755 "${srcdir}/run-mimaflux.sh"                  "${pkgdir}/usr/bin/${pkgname%-git}"

	install -Dm644 "${srcdir}/mimaflux.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-git}"

	# Docs
	install -Dm644 "README.md"      -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
	install -Dm644 "screenshot.png" -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
	find examples/ -type f -exec install -Dm644 "{}" -t "${pkgdir}/usr/share/doc/${pkgname%-git}/examples" \;

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
