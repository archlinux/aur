# $Id: PKGBUILD 153111 2015-12-12 09:19:10Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Di "thc_flow" Abel <nospam@weedsmoker.im>

pkgname=ironpython
pkgver=2.7.5
pkgrel=3
pkgdesc="Python implementation for the .NET framework"
arch=("any")
url="http://ironpython.net"
license=("Apache")
depends=('mono')
source=("https://github.com/IronLanguages/main/archive/ipy-$pkgver.zip")
md5sums=('85951a4125fb733cdeaced19f3ff7157')

prepare() {
  cd "$srcdir/main-ipy-$pkgver"

  # Workaround errors during Stage
  # https://github.com/IronLanguages/main/issues/1156
  # TODO: make this less ugly...
  mv Languages/IronPython/Public/License.{R,r}tf

  mkdir -p bin/{Silverlight5Release/DLLs,v45Release/DLLs,v2Release/DLLs}
  touch \
    bin/Silverlight5Release/Microsoft.{Dynamic,Scripting}.{xml,dll} \
    bin/Silverlight5Release/Microsoft.Scripting.Silverlight.dll \
    bin/Silverlight5Release/IronPython{,.Modules}.{xml,dll} \
    bin/Silverlight5Release/DLLs/IronPython.SQLite.{xml,dll} \
    bin/v45Release/Microsoft.{Dynamic,Scripting}.{xml,dll} \
    bin/v45Release/Microsoft.Scripting.{Metadata,AspNet}.{xml,dll} \
    bin/v45Release/IronPython{,.Modules}.{xml,dll} \
    bin/v45Release/DLLs/IronPython.SQLite.{xml,dll} \
    bin/v2Release/Microsoft.{Dynamic,Scripting}.{xml,dll} \
    bin/v2Release/Microsoft.Scripting.{Metadata,AspNet,Core}.{xml,dll} \
    bin/v2Release/IronPython{,.Modules}.{xml,dll} \
    bin/v2Release/DLLs/IronPython.SQLite.{xml,dll}
}

build() {
  cd "$srcdir/main-ipy-$pkgver"
  xbuild /t:Stage '/p:BaseConfiguration=Release;Mono=true' /verbosity:minimal /nologo
}

check() {
  cd "$srcdir/main-ipy-$pkgver"
  # Not really runable now
  # make test-ipy
}

package() {
  cd "$srcdir/main-ipy-$pkgver"
  install -d "$pkgdir"/usr/{lib,bin}

  rm -r Stage/Release/IronPython-$pkgver/{Silverlight,Platforms}
  cp -r Stage/Release/IronPython-$pkgver "$pkgdir/usr/lib/ipy"

  for bin in ipy ipy64 ipyw ipyw64; do
    echo -e "#!/bin/sh\nmono /usr/lib/ipy/$bin.exe \$*" > "$pkgdir/usr/bin/$bin"
    chmod +x "$pkgdir/usr/bin/$bin"
  done
}
