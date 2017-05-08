# Maintainer: Michael Serpieri <mickybart@pygoscelis.org>

pkgbase=libhybris-ext-git
pkgname=('libhybris-ext-git' 'libhybris-ext-libgl-git' 'libhybris-ext-wayland-egl-git')
_pkgbase=libhybris
pkgver=1245.a1f2e5d
pkgrel=2
arch=('armv7h')
url="https://github.com/mickybart/libhybris_ext"
license=('Apache')
makedepends=('wayland' 'hybris-android-headers')
source=("libhybris::git+https://github.com/mickybart/libhybris_ext#branch=master-next")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${_pkgbase}"

}

build() {
  cd "${srcdir}/${_pkgbase}/hybris"

  ./autogen.sh \
    --prefix=/opt/android/hybris \
    --with-android-headers=/opt/android/include \
    --enable-wayland
  make

  # fake installation
  mkdir ${srcdir}/fakeinstall
  # lib dependency issue: workaround with -j1
  make -j1 DESTDIR="${srcdir}/fakeinstall" install
}

package_libhybris-ext-git() {
  pkgdesc="hybris allows to use bionic-based HW adaptations in glibc systems (ext version)"
  depends=('hybris-android-headers')
  provides=('libhybris')
  conflicts=('libhybris')

  cd "${srcdir}/${_pkgbase}/hybris"

  cp -av ${srcdir}/fakeinstall/* ${pkgdir}/

  # move pkgconfig to standard path
  install -m755 -d "${pkgdir}/usr/lib/"
  mv "${pkgdir}/opt/android/hybris/lib/pkgconfig" "${pkgdir}/usr/lib/" 
  rm -f ${pkgdir}/usr/lib/pkgconfig/{egl,glesv1_cm,glesv2,wayland-egl}.pc

  # create symlink to /usr/lib for every lib except those handle by package libgl, libwayland-egl
  find ${pkgdir}/opt/android/hybris/lib/ -type l -exec cp -a {} ${pkgdir}/usr/lib/ \;
  for i in $(find ${pkgdir}/opt/android/hybris/lib/ -not -type l -type f); do
    ln -s /opt/android/hybris/lib/$(basename $i) ${pkgdir}/usr/lib/
  done
  for i in $(find ${pkgdir}/usr/lib/ -name 'libEGL.so*' -or -name 'libGLES*' -or -name 'libwayland-egl.so*'); do
    rm -f $i
  done
}

package_libhybris-ext-libgl-git() {
  pkgdesc="hybris 3-D graphics library"
  depends=('libhybris' 'libhybris-ext-wayland-egl-git' 'mesa-hybris')
  provides=('libgl')
  replaces=('libgl')
  conflicts=('libgl')

  install -m755 -d ${pkgdir}/usr/lib/pkgconfig
  cp -av ${srcdir}/fakeinstall/opt/android/hybris/lib/pkgconfig/{egl,glesv1_cm,glesv2}.pc ${pkgdir}/usr/lib/pkgconfig/

  # WORKAROUND: libGL is not provided by libhybris so we use the one from mesa.
  #             Of course it will NOT work but we need it for Xwayland used kwin_wayland.
  #             Xwayland support should be broken and will need some analyze and fix.
  ln -s /usr/lib/mesa/libGL.so.1.2.0 ${pkgdir}/usr/lib/libGL.so.1.2.0
  ln -s libGL.so.1.2.0 ${pkgdir}/usr/lib/libGL.so.1
  ln -s libGL.so.1.2.0 ${pkgdir}/usr/lib/libGL.so

  ln -s /opt/android/hybris/lib/libEGL.so.1.0.0 ${pkgdir}/usr/lib/libEGL.so.1.0.0
  ln -s libEGL.so.1.0.0 ${pkgdir}/usr/lib/libEGL.so.1
  ln -s libEGL.so.1.0.0 ${pkgdir}/usr/lib/libEGL.so

  ln -s /opt/android/hybris/lib/libGLESv1_CM.so.1.0.1 ${pkgdir}/usr/lib/libGLESv1_CM.so.1.0.1
  ln -s libGLESv1_CM.so.1.0.1 ${pkgdir}/usr/lib/libGLESv1_CM.so.1
  ln -s libGLESv1_CM.so.1.0.1 ${pkgdir}/usr/lib/libGLESv1_CM.so

  ln -s /opt/android/hybris/lib/libGLESv2.so.2.0.0 ${pkgdir}/usr/lib/libGLESv2.so.2.0.0
  ln -s libGLESv2.so.2.0.0 ${pkgdir}/usr/lib/libGLESv2.so.2
  ln -s libGLESv2.so.2.0.0 ${pkgdir}/usr/lib/libGLESv2.so

}

package_libhybris-ext-wayland-egl-git() {
  pkgdesc="hybris 3-D wayland library"
  depends=('libhybris')
  provides=('libwayland-egl')
  replaces=('libwayland-egl')
  conflicts=('libwayland-egl')

  install -m755 -d ${pkgdir}/usr/lib/pkgconfig
  cp ${srcdir}/fakeinstall/opt/android/hybris/lib/pkgconfig/wayland-egl.pc ${pkgdir}/usr/lib/pkgconfig

  ln -s /opt/android/hybris/lib/libwayland-egl.so.1.0.0 ${pkgdir}/usr/lib/libwayland-egl.so.1.0.0
  ln -s libwayland-egl.so.1.0.0 ${pkgdir}/usr/lib/libwayland-egl.so.1
  ln -s libwayland-egl.so.1.0.0 ${pkgdir}/usr/lib/libwayland-egl.so
}

