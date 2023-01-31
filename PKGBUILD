# Maintainer: Ronald Record <github@ronrecord.com>

pkgname=essentia-extractor
pkgver=v2.1.0r1
pkgrel=1
pkgdesc="C++ library for audio analysis and audio-based music information retrieval"
arch=('x86_64' 'armv7h')
url="https://github.com/doctorfree/mpplus-essentia"
license=('AGPL3')
depends=(taglib ffmpeg4.4 python python-numpy python-six eigen fftw clang libsamplerate chromaprint libyaml)
makedepends=(git zip)
source=("${pkgname}::git+https://github.com/doctorfree/mpplus-essentia.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  [ -f /usr/include/gaia2/gaia.h ] && [ -f /usr/lib/libgaia2.a ] || {
    # Need to install Gaia, an Essentia build dependency
    PROJ="libgaia2"
    git clone https://aur.archlinux.org/${PROJ}.git

    cd ${PROJ}
    makepkg
    sudo pacman -U --noconfirm libgaia2*.zst
  }
}

build() {
  cd "${srcdir}/${pkgname}"
  # Configure and build essentia
  PKGPATH=`pkg-config --variable pc_path pkg-config`
  [ -d /usr/lib/ffmpeg4.4/pkgconfig ] && {
    PKGPATH="/usr/lib/ffmpeg4.4/pkgconfig:${PKGPATH}"
  }
  [ -d /usr/lib64/compat-ffmpeg4/pkgconfig ] && {
    PKGPATH="/usr/lib64/compat-ffmpeg4/pkgconfig:${PKGPATH}"
  }
  export PKG_CONFIG_PATH="${PKGPATH}:/usr/lib/pkgconfig"

  python3 waf configure --prefix=/usr \
                        --build-static \
                        --with-gaia \
                        --with-python \
                        --with-example=streaming_extractor_music
  python3 waf
}

package() {
  cd "${srcdir}/${pkgname}"
  destdir=usr
  for dir in "${destdir}" "${destdir}/share" \
    "${destdir}/share/doc" \
    "${destdir}/share/doc/${pkgname}" \
    "${destdir}/share/${pkgname}"
  do
    [ -d ${pkgdir}/${dir} ] || mkdir ${pkgdir}/${dir}
  done

  # Install essentia
  python3 waf install --destdir="${pkgdir}"

  cp ACKNOWLEDGEMENTS ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp AUTHORS ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp Changelog ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp COPYING.txt ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp README.md ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp "Essentia Licensing.txt" ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp FAQ.md ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp VERSION ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp MPPVERSION ${pkgdir}/${destdir}/share/doc/${pkgname}
  gzip -9 ${pkgdir}/${destdir}/share/doc/${pkgname}/Changelog
  cp -a share/svm_models ${pkgdir}/${destdir}/share/${pkgname}/svm_models

  chmod 755 ${pkgdir}/${destdir}/bin/* \
            ${pkgdir}/${destdir}/bin
}
