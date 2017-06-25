# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=logitechmediaserver-git
pkgver=7.9.1
_gitver=7.9
pkgrel=3
pkgdesc='Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server. (Git-Version, if you prefer stability consider using logitechmediaserver instead)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/stefansielaff/slimserver'
license=('GPL' 'custom')
provides=('logitechmediaserver')
depends=('perl>=5.26' 'perl<5.27' 'perl-anyevent' 'perl-archive-zip' 'perl-cgi' 'perl-common-sense' 'perl-data-dump'
	 'perl-dbd-sqlite' 'perl-dbi' 'perl-digest-sha1' 'perl-ev' 'perl-yaml-libyaml'
	 'perl-html-parser' 'perl-html-form' 'perl-html-tree'
	 'perl-json-xs' 'perl-module-build' 'perl-sub-name' 'perl-sub-uplevel'
	 'perl-template-toolkit' 'perl-test-nowarnings' 'perl-test-warn'
	 'perl-uri' 'perl-xml-parser' 'perl-xml-simple'
	 'ffmpeg' 'giflib' 'libexif' 'libjpeg-turbo' 'libpng')
makedepends=('yasm' 'rsync' 'gd' 'zlib')
optdepends=('perl-io-socket-ssl: support for https streams')
optdepends_x86_64=('lib32-glibc: transcoding on 64-bit systems' 'lib32-gcc-libs: transcoding on 64-bit systems' 'perl-io-socket-ssl: support for https streams')
install=install
source=("slimserver.tar.gz::${url}/archive/public/${_gitver}.tar.gz"
        "slimserver-vendor.tar.gz::${url}-vendor/archive/public/${_gitver}.tar.gz"
        'service')
sha256sums=('SKIP'
	    'SKIP'
	    'f5c64f2a066914dbab9a1dd4a8ec33895645a72bde3bdbeb83c49e4624a997cb')

prepare() {
	cd "${srcdir}/slimserver-public-${_gitver}"
	case $CARCH in
	    x86_64) rm -rf Bin/{arm,armhf}-linux ;;
	    i686) rm -rf Bin/{arm,armhf}-linux ;;
	    arm*) rm -rf Bin/{i386,x86_64}-linux ;;
	esac
	cd "${srcdir}/slimserver-public-${_gitver}/CPAN"
	mkdir _PRESERVE
	cp -p --parents URI/Find.pm _PRESERVE
	rm -f {AE.pm,AnyEvent.pm,DBI.pm,JSON/XS.pm,Template.pm,URI.pm,version.pm}
	rm -rf {AnyEvent,Archive,CGI,common,DBI,DBD,Digest,HTML,Sub,Template,URI,version,XML,YAML}
	cp -rf _PRESERVE/* .
}

build() {
	cd "${srcdir}/slimserver-vendor-public-${_gitver}/CPAN"
	sh buildme.sh -t
}

package() {
        cd "${srcdir}"
        install -Dm644 service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
        cd "${srcdir}/slimserver-public-${_gitver}"
        install -d "${pkgdir}"/{opt,usr/share/licenses}/"${pkgname}" && ln -s "/opt/${pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        cp -a * "${pkgdir}/opt/${pkgname}"
        cd "${srcdir}/slimserver-vendor-public-${_gitver}"
        cp -a CPAN/build/5.*/lib/*/*linux*/* "${pkgdir}/opt/${pkgname}/CPAN"
	printf "ARCH-AUR-GIT.%s\n%s" "${pkgver}" "$(date)" > "${pkgdir}/opt/${pkgname}/revision.txt"
}

