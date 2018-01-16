pkgname=psp-sdk
pkgver=1.0
pkgrel=1
pkgdesc="An open-source SDK for PSP homebrew development (psp)"
arch=(any)
url="https://github.com/pspdev/pspsdk"
license=('GPL')
groups=('psp')
depends=('zlib')
makedepends=('psp-gcc' 'git')
conflicts=('psp-sdk-base')
provides=('psp-sdk-base')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/pspsdk.git")
md5sums=('SKIP')


prepare()
{
  cd "$srcdir/pspsdk"
  sed -i "/Could not allocate the section data buffer/d" tools/unpack-pbp.c
}

build()
{
  cd "$srcdir/pspsdk"
  ./bootstrap
  mkdir -p build-psp && pushd build-psp
  ../configure --with-pspdev=/usr --target=psp
  make
}

package()
{
  cd "$srcdir/pspsdk/build-psp"
  make install DESTDIR="$pkgdir"

  # call psp-config with full path as PATH has /bin first
  # path must end with /bin/psp-config so move it to /usr/psp/bin
  install -d "$pkgdir"/usr/psp/bin/
  mv "$pkgdir"/usr/bin/psp-config "$pkgdir"/usr/psp/bin/psp-config
  echo '#/bin/sh' > psp-config
  echo '/usr/psp/bin/psp-config $*' >> psp-config
  install -m755 psp-config "$pkgdir"/usr/bin
}

