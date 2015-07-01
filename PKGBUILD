# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Lukas Nagl <LukasN(at)gmx(dot)at>
# Contributor: DocterD <docterdee(at)gmail(dot)com>
# Contributor: benwbooth <benwbooth(at)gmail(dot)com>
# Contributor: Antoine Martin <antoine(dot)a(dot)martin(at)gmail(dot)com>
# Contributor: Michie DeBerry <michie(dot)deberry(at)gmail(dot)com>
# Contributor: Jorge Israel Peña <jorgepblank(at)gmail(dot)com>

pkgname=air-video-server
pkgver=2.4.6_beta3
_pkgver=2.4.6-beta3
pkgrel=8
pkgdesc="A media server that can stream videos in almost any format from your PC to your iPhone, iPad and iPod touch"
arch=('i686' 'x86_64')
url="http://www.inmethod.com/air-video/index.html"
license=('custom')
depends=('zlib' 'lame' 'x264' 'faac' 'gpac' 'java-runtime' 'fontconfig' 'libcups')
makedepends=('yasm')
backup=('etc/conf.d/air-video-server')
install=${pkgname}.install
source=(http://s3.amazonaws.com/AirVideo/Linux-${_pkgver}/libav.tar.bz2
        http://s3.amazonaws.com/AirVideo/Linux-${_pkgver}/AirVideoServerLinux.jar
        ${pkgname}.properties
        ${pkgname}.sh
        ${pkgname}.rc
        ${pkgname}.autostart
        ${pkgname}-enabled.autostart
        ${pkgname}.service
        ${pkgname}-systemd.service
        mp4creator.sh
        LICENSE)
noextract=('AirVideoServerLinux.jar')
md5sums=('2bb3080b08ad315c5372678866e4736c'
         '76b74c9e7073e9d02916d82b485a2eef'
         '3d5f5f3405cc867623a00023fc70f217'
         'e5237f30a6db31e0f558ae2d95745071'
         'd58ec49b2f158e3f15c4997cc830ad8c'
         '702f82c153faf742ab451bf2f26500ea'
         '8c22ac2bca52463ea2f2da3546d0e1cf'
         'e099a2317c599d99d75a9af2f8ba6fd0'
         '572cd90983febcf97b7ce5633240db95'
         '6e9403f1dd14654844ece68a3cc35f7e'
         '44dd1b2e8cf08cb372ba51217d267ad5')
                                    
build() {
  cd ${srcdir}/libav

  TMPDIR=${srcdir} ./configure --prefix=/usr --enable-pthreads \
    --disable-shared --enable-static --enable-libfaac --enable-libx264 \
    --enable-libmp3lame --enable-gpl --enable-nonfree 
  make
}

package() {
  cd ${srcdir}

  # core files  
  install -m755 -d ${pkgdir}/usr/share/${pkgname}
  install -m644 AirVideoServerLinux.jar ${pkgdir}/usr/share/${pkgname}
  install -m644 ${pkgname}.properties ${pkgdir}/usr/share/${pkgname}
  install -m755 libav/avconv ${pkgdir}/usr/share/${pkgname}
  install -Dm755 mp4creator.sh ${pkgdir}/usr/share/${pkgname}/mp4creator
  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.properties ${pkgdir}/etc/conf.d/${pkgname}

  # rc.d
  install -Dm755 ${pkgname}.rc ${pkgdir}/etc/rc.d/${pkgname}
  
  # autostart
  install -Dm644 ${pkgname}.autostart ${pkgdir}/etc/xdg/autostart/${pkgname}.desktop
  install -m644 ${pkgname}-enabled.autostart ${pkgdir}/usr/share/${pkgname}/${pkgname}.desktop

  # avahi
  install -Dm644 ${pkgname}.service ${pkgdir}/etc/avahi/services/${pkgname}.service

  # systemd
  install -Dm644 ${pkgname}-systemd.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service

  # licenses
  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}/libav
  install -m644 libav/{LICENSE,COPYING.*} ${pkgdir}/usr/share/licenses/${pkgname}/libav
}
