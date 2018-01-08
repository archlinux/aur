pkgname='urn-lang-git'
pkgver=0.6.1.r57.g64ad9f8
pkgrel=1
pkgdesc='Yet another Lisp dialect which compiles to Lua'
source=('urn::git+https://gitlab.com/urn/urn.git#branch=master')
md5sums=('SKIP')
arch=('any')
url='http://urn-lang.com/'
license=('BSD')
depends=('lua>=5.1')
optdepends=('luajit: readline support'
            'luarocks: readline or linenoise rock support')
provides=('urn-lang')
conflicts=('urn-git')

pkgver() {
  cd "${srcdir}/urn"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/urn"
  make all
  make all # for optimization
}

check() {
  cd "${srcdir}/urn"
  make QUIET=1 test
}

package() {
  cd "${srcdir}/urn"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/urn"
  install -dm755 "${pkgdir}/usr/lib/urn"

  find bin lib plugins -type d -exec install -dm755 "${pkgdir}/usr/share/urn/{}" \;
  find lib plugins -type f -exec install -m644 "{}" "${pkgdir}/usr/share/urn/{}" \;
  find bin -type f -exec install -m755 "{}" "${pkgdir}/usr/share/urn/{}" \;

  cat << EOF > "${pkgdir}/usr/bin/urn"
#!/usr/bin/env sh
exec lua /usr/share/urn/bin/urn.lua -i /usr/lib/urn -i ~/.local/lib/urn "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/urn"

  cp "${srcdir}/urn/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
