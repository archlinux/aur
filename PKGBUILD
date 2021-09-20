# Maintainer: xerus <27f at pm dot me>

_pkgname=pleroma
pkgname=${_pkgname}-git
pkgver=2.4.1.r0.g0b2119d4a
pkgrel=1
pkgdesc='A microblogging server software that can federate (= exchange messages with) other servers that support ActivityPub.'
url='https://git.pleroma.social/pleroma/pleroma'
license=('AGPL' 'CCPL:cc-by-4.0' 'CCPL:cc-by-sa-4.0')
arch=(any)
makedepends=(elixir)
depends=(ncurses file)
optdepends=('postgresql: local postgresql database support'
            'imagemagick: Pleroma.Upload.Filters.Mogrify, Pleroma.Upload.Filters.Mogrifun support'
            'ffmpeg: media preview proxy support for videos'
            'perl-image-exiftool: supporting stripping location (GPS) data from uploaded images with Pleroma.Upload.Filters.Exiftool')
provides=("${_pkgname}")
backup=('etc/pleroma/config.exs')
install=pleroma.install
source=('pleroma.sysusers'
        'pleroma.tmpfiles'
        'pleroma.service'
        'COPYING'
        "git+${url}.git#branch=stable")
sha256sums=('4df8a0099dada9bf652fb07677a9c6a66cad1f26498f08a55d8acb0186b78979'
            'b5e844fab22dc4fafdec09c1f14437a06d3a12fae753fc0be968d22eaddfd6dc'
            '268952ef036ef65ab146a38ff20bbba35759c0f33510fe6ca15d6765285938ed'
            'e299229268576c559d0155baccccf682c97b51bebab40a0b7ff3ab562ec62104'
            'SKIP')

package() {
    mkdir -p "${pkgdir}/opt/pleroma"

    cd "$srcdir"
    install -Dm 644 pleroma.sysusers "${pkgdir}/usr/lib/sysusers.d/pleroma.conf"
    install -Dm 644 pleroma.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/pleroma.conf"
    install -Dm 644 pleroma.service "${pkgdir}/usr/lib/systemd/system/pleroma.service"
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${_pkgname}"
    mix local.hex --force
    mix deps.get
    MIX_ENV=prod mix pleroma.instance gen
    mv config/{generated_config.exs,prod.secret.exs}
    psql -f config/setup_db.psql
    MIX_ENV=prod mix ecto.migrate
}

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
