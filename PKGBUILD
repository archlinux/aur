# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkgname=mpd
pkgname=${_pkgname}-server-minimal
pkgver=0.23.4
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music. Minimal version with only flac playback over alsa as server running under mpd user."
arch=(i686 x86_64 armv7h)
url="https://www.musicpd.org/"
license=(GPL)
depends=(alsa-lib flac fmt icu libmpdclient liburing systemd-libs zlib)
makedepends=(boost meson python-sphinx systemd)
provides=("${_pkgname}=${pkgver}")
conflicts=(${_pkgname})
backup=(etc/${_pkgname}.conf)
source=("${url}/download/${_pkgname}/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        ${_pkgname}.tmpfiles
        ${_pkgname}.sysusers
        ${_pkgname}.conf)
sha512sums=(fb476b108a7be842663683fe6ca6737cffad73c0f09874f9d052121d188d16f69b144e993d1691f2edfac713db24aa3c28302b399f4720b29c09c909860c0938
            SKIP
            a2c1840bfaa96d0d21f66faa754404b3b0e63d032106e518e5e8276b3a19a7e3cf0fe6ea38471b6c02c0aea602aee8cee40b40231581de1256f7577461598012
            d6f36996089cbe746f7d7062e12723d8a41a0118da9301c053e4c244221d7a32b2b0c3d64b604714243be50a98dde00f2513680dc43fc6ac12622200fc234f73
            25a823740d92da8e186916701413114142eb6ad91a172c592e68b569c8e4f50fa99580e555ccf6cd31fc4f55a09bfe0278efa46e4e76ee0fe02846292fadf3c1)
b2sums=(34ea3f0065edcb26e57350a9cdfc79e8705674a4811b06ff4dfa0a93a1c92bcfae7c9e6ae208210289a1f11fac079aa53ad34a3b317fd5dbe4c6d522883b6623
        SKIP
        efe312e269f30ff1413c43c5ff712548f58a8099b32f4a709b8441d1e58444c2e8306d041f4e8d355a06ea5b1c86f4985b531cc17f2e7d83d0fd514f59a1b853
        97e7d992a0c347fa6f34464136e5b603bdf50eb4a4718504c951ab9ef34d17f0f7b9f917974d049b88e54185dce2f64eb0e59fd40aa921b11d9703219809c29e
        0969a3c477b6a3f34b44e067e515d7f306414dd14e0163584417b9d071e3cc825898219f7ff66ead7905b15429b8411304052d3b2b14a72e560bfabf9bf0adcf)
validpgpkeys=(0392335A78083894A4301C43236E8A58C6DB4512) # Max Kellermann <max@musicpd.org>

prepare() {
    cd ${_pkgname}-${pkgver}
    sed -e '/\[Service\]/a User=mpd' -i systemd/system/${_pkgname}.service.in
}

build() {
    cd ${_pkgname}-${pkgver}
    _opts=('-Ddocumentation=enabled'
           '-Dhtml_manual=false'
           '-Dmanpages=true'
           '-Dtest=false'
           '-Dsyslog=disabled'
           '-Dinotify=true'
           '-Dio_uring=enabled'
           '-Ddaemon=true'
           '-Dsystemd=enabled'
           '-Dtcp=true'
           '-Dipv6=enabled'
           '-Dlocal_socket=false'
           '-Ddsd=false'
           '-Ddatabase=true'
           '-Dupnp=disabled'
           '-Dlibmpdclient=enabled'
           '-Dneighbor=false'
           '-Dudisks=disabled'
           '-Dwebdav=disabled'
           '-Dcue=false'
           '-Dcdio_paranoia=disabled'
           '-Dcurl=disabled'
           '-Dmms=disabled'
           '-Dnfs=disabled'
           '-Dsmbclient=disabled'
           '-Dqobuz=disabled'
           '-Dsoundcloud=disabled'
           '-Dbzip2=disabled'
           '-Diso9660=disabled'
           '-Dzzip=disabled'
           '-Did3tag=disabled'
           '-Dchromaprint=disabled'
           '-Dadplug=disabled'
           '-Daudiofile=disabled'
           '-Dfaad=disabled'
           '-Dffmpeg=disabled'
           '-Dflac=enabled'
           '-Dfluidsynth=disabled'
           '-Dgme=disabled'
           '-Dmad=disabled'
           '-Dmikmod=disabled'
           '-Dmodplug=disabled'
           '-Dopenmpt=disabled'
           '-Dmpcdec=disabled'
           '-Dmpg123=disabled'
           '-Dopus=disabled'
           '-Dsidplay=disabled'
           '-Dsndfile=disabled'
           '-Dtremor=disabled'
           '-Dvorbis=disabled'
           '-Dwavpack=disabled'
           '-Dwildmidi=disabled'
           '-Dvorbisenc=disabled'
           '-Dlame=disabled'
           '-Dtwolame=disabled'
           '-Dshine=disabled'
           '-Dwave_encoder=false'
           '-Dlibsamplerate=disabled'
           '-Dsoxr=disabled'
           '-Dalsa=enabled'
           '-Dao=disabled'
           '-Dfifo=true'
           '-Dhttpd=false'
           '-Djack=disabled'
           '-Dopenal=disabled'
           '-Doss=disabled'
           '-Dpipe=false'
           '-Dpipewire=disabled'
           '-Dpulse=disabled'
           '-Drecorder=false'
           '-Dshout=disabled'
           '-Dsnapcast=false'
           '-Dsndio=disabled'
           '-Dsolaris_output=disabled'
           '-Ddbus=disabled'
           '-Dexpat=disabled'
           '-Dicu=enabled'
           '-Diconv=disabled'
           '-Dpcre=disabled'
           '-Dsqlite=disabled'
           '-Dyajl=disabled'
           '-Dzlib=enabled'
           '-Dzeroconf=disabled'
    )

    arch-meson ${_opts[@]} -D b_ndebug=true build
    ninja -C build
}

package() {
    cd ${_pkgname}-${pkgver}

    DESTDIR="${pkgdir}" ninja -C build install

    install -Dm644 doc/mpdconf.example -t "${pkgdir}"/usr/share/doc/mpd/

    install -Dm644 "${srcdir}"/${_pkgname}.conf "${pkgdir}"/etc/${_pkgname}.conf
    install -Dm644 "${srcdir}"/${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
    install -Dm644 "${srcdir}"/${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf

    # Remove user service
    rm -rf "${pkgdir}"/usr/lib/systemd/user/
}
