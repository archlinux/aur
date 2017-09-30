# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=logitechmediaserver
pkgver=7.9.1.arch3
pkgrel=1
pkgdesc='Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server. (Release-Version, if you prefer bleeding edge consider using logitechmediaserver-git instead)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/stefansielaff/slimserver'
license=('GPL' 'custom')
depends=('perl>=5.26'
         'perl<5.27'
         'perl-anyevent'
         'perl-archive-zip'
         'perl-cgi'
         'perl-common-sense'
         'perl-data-dump'
         'perl-dbd-sqlite'
         'perl-dbi'
         'perl-digest-sha1'
         'perl-ev'
         'perl-html-form'
         'perl-html-parser'
         'perl-html-tree'
         'perl-http-cookies'
         'perl-http-daemon'
         'perl-http-date'
         'perl-http-message'
         'perl-json-xs'
         'perl-log-log4perl'
         'perl-lwp-mediatypes'
         'perl-lwp-protocol-https'
         'perl-module-build'
         'perl-net-ipv4addr'
         'perl-net-upnp'
         'perl-path-class'
         'perl-soap-lite'
         'perl-readonly'
         'perl-sub-name'
         'perl-sub-uplevel'
         'perl-template-toolkit'
         'perl-test-nowarnings'
         'perl-test-warn'
         'perl-text-glob'
         'perl-uri'
         'perl-xml-parser'
         'perl-xml-simple'
         'perl-yaml-libyaml'
         'ffmpeg' 'giflib' 'libexif' 'libjpeg-turbo' 'libpng')
optdepends=('perl-io-socket-ssl: support for https streams')
optdepends_x86_64=('lib32-glibc: transcoding on 64-bit systems' 'lib32-gcc-libs: transcoding on 64-bit systems')
makedepends=('nasm' 'yasm' 'rsync' 'gd' 'zlib')
install=install
source=("slimserver-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "slimserver-vendor-${pkgver}.tar.gz::${url}-vendor/archive/${pkgver}.tar.gz"
        'service')
sha256sums=('ea107b51120446a53c0536b6b5b283eb31551ed6415070026bf2526abf0145f5'
            '2852dc0457d21be21d69b8978a950be978e0e5602483862cbe4e838acefa3bd8'
            '07208896fed78eb9cb0086360c02f3226ecf1be9a061d55a6f95b9a60b6d6735')

prepare() {
    cd "${srcdir}/slimserver-${pkgver}"
    case $CARCH in
        x86_64) rm -rf Bin/{arm,armhf}-linux ;;
        i686) rm -rf Bin/{arm,armhf}-linux ;;
        arm*) rm -rf Bin/{i386,x86_64}-linux ;;
    esac
    cd "${srcdir}/slimserver-${pkgver}/CPAN"
    mkdir _PRESERVE
    cp -p --parents URI/Find.pm _PRESERVE
    rm -f {AE.pm,AnyEvent.pm,CGI.pm,DBI.pm,Error.pm,EV.pm,JSON/XS.pm,LWP.pm,Readonly.pm,Template.pm,Text/Glob.pm,URI.pm,version.pm}
    rm -rf {AnyEvent,Archive,CGI,common,DBI,DBD,Digest,EV,HTML,HTTP,I18N,Mac,Log,LWP,Net,Path,SOAP,Sub,Template,Test,URI,version,XML,YAML}
    cp -rf _PRESERVE/* .
    rm -rf _PRESERVE
}

build() {
    cd "${srcdir}/slimserver-vendor-${pkgver}/CPAN"
    sh buildme.sh -t
}

package() {
    cd "${srcdir}"
    install -Dm644 service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    cd "${srcdir}/slimserver-${pkgver}"
    install -d "${pkgdir}"/{opt,usr/share/licenses}/"${pkgname}" && ln -s "/opt/${pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -a * "${pkgdir}/opt/${pkgname}"
    cd "${srcdir}/slimserver-vendor-${pkgver}"
    cp -a CPAN/build/5.*/lib/*/*linux*/* "${pkgdir}/opt/${pkgname}/CPAN"
    printf "ARCH-AUR-REL.%s\n%s" "${pkgver}" "$(date)" > "${pkgdir}/opt/${pkgname}/revision.txt"
}

