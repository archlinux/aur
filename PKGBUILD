# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-gegl
_pkgbase=gegl
pkgver=0.4.36
_commit=31763e39265adab1142418f6d5cedbd4d3581e06  # tags/GEGL_0_4_36
pkgrel=2
pkgdesc="Graph based image processing framework (32-bit)"
arch=('x86_64')
url="https://www.gegl.org/"
license=('GPL3' 'LGPL3')
depends=("gegl>=$pkgver"
         'lib32-babl' 'lib32-libspiro' 'lib32-json-glib'
         'lib32-poppler-glib'
         'lib32-libgexiv2' 'lib32-libraw' 'lib32-openexr'
         'lib32-librsvg' 'lib32-libtiff'
         'lib32-lensfun' 'lib32-luajit'
         'lib32-jasper'
         'lib32-suitesparse'
         'lib32-ffmpeg' 'ffmpeg')
makedepends=('intltool' 'ruby' 'mesa' 'glu' 'exiv2' 'meson' 'vala'
             'xorgproto' 'shared-mime-info' 'gobject-introspection'
             'lib32-sdl2' 'python-gobject')
source=("git+https://gitlab.gnome.org/GNOME/$_pkgbase.git#commit=$_commit"
        "x86-linux-gnu"
        "libavcodec.pc"
        "libavdevice.pc"
        "libavfilter.pc"
        "libavformat.pc"
        "libavutil.pc"
        "libpostproc.pc"
        "libswresample.pc"
        "libswscale.pc"
        "sdl2.pc")
sha512sums=('SKIP'
            '0d1cd8d934db76b93ecb85d41badd95800a7bf9b80dfe80c91d457cc778a4604bd0015ef1a05056990d9d80a5a32d23c05d06a2a5102714d2dd01b97947dc5f8'
            '69a2cff0db30b445dbf8adf80b7b63b5f28631bf02f43c3ed0d02e11d162a6f01b9a661a760af6542b21c1d393a61d317ad430c835a54353a778a22279bbc0bd'
            '2874ebb198713a34f0859659c6e62872c8a5b87e25b61567395a4bb02530d321ddb0dd90cd00870c2ae0254ac797a835f8b4a70ba59aef55a2daa2d7ffb7e04c'
            'a4bee13b833b10c14032bbabcf2956e99ea998081020ef1e5228d9417d4c58fd69106d59c56dc26089529c2b9ab41cb6038947df2c325bda4479161e4f181543'
            'ecdf5a5bb36d5f5fabd26f44530664dfd65528e320642ebc0e2bb8d00d4849f0b3a6939693bf926d7f92a0b7cb868638c02ca21016e4f9cd0a9605fbe6693b03'
            '19e2f5c180b74bbe267f4ce48f8be35d893d17c9f9d86d15e35a271e2b522fa9e1b26255fef27f10dbcca3678d499c7b9080823bfc63ee28c8159722d7f11a24'
            '73de53df341355ea7a616eb8f81b301ac2273c24ba39973b26ae5793f82c1e1f10b9f615159a04b7c662251402c6b74d5cd4a237676bf0205f7a73bacb868e96'
            'd7497b7f4a009dd3219c0d2b5d6e67e8bb5bea3fb7efa63192d1b7853d48785ba94f6c0bd89756941e7bac992f5b9cadd0717386f73bf5c4529066c1f607d3df'
            '17bc7a78872deef6f5cc5fe8110535070d5eecd6cd67f261c512d8b6922c0ab29e7b3ff0d4708db4c0643dd9e98e673cd745cfab6f6615ddf40f9eb7f47fec9d'
            '00767b84218d5105d4e3f88f1e43d284ba7f3fbd81204f303e0c245a5d5859f812b32bc61b3faaacb97d7ee7fc509b365bcaa167c849c61f3d95621ca0f8fa51')

prepare() {
  for pkg in vapigen.pc gobject-introspection-1.0.pc pygobject-3.0.pc; do
      cp "/usr/lib/pkgconfig/$pkg" "$srcdir/"
  done
  for pkg in xproto.pc kbproto.pc xextproto.pc renderproto.pc shared-mime-info.pc; do
      cp "/usr/share/pkgconfig/$pkg" "$srcdir/"
  done
  cd "$_pkgbase"
  git cherry-pick -n 002f4807e511e65c885cb7c10643b6f44a514eb3..7e19debd83f0658b59fc86c214332ded4f935035
}

build() {
  mkdir -p "build"
  meson setup \
      "${_pkgbase}" "build" \
      --prefix      /usr \
      --sbindir     bin \
      --buildtype   plain \
      --libexecdir  lib32 \
      --libdir      /usr/lib32 \
      --auto-features enabled \
      --wrap-mode     nodownload \
      -Db_lto=true -Db_pie=true \
      -Dworkshop=true -Dmrg=disabled -Dmaxflow=disabled \
      --cross-file  x86-linux-gnu
  ninja -C "build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "build" install
  rm -r "$pkgdir/usr/"{share,include,bin}
}

