# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=adchpp
pkgver=2.12.1
pkgrel=1
pkgdesc="ADCH++ is a hub software for the ADC network."
url='http://adchpp.sourceforge.net'
arch=('i686' 'x86_64')
license=("GPL")
depends=('ruby'
         'python2'
         'boost-libs'
         ) # 'lua51' 'lua51-filesystem' 'lua51-socket'
makedepends=('scons'
             'swig'
             'bzr'
             'asciidoc'
             )
backup=('etc/adchpp/Script.xml'
        'etc/adchpp/adchpp.xml')
source=("http://downloads.sourceforge.net/project/adchpp/Releases/ADCH%2B%2B%202.12/${pkgver}/adchpp_${pkgver}_source.tar.gz"
        'adchpp.sh'
        'adchpp.service'
        'adchpp.tmpfile'
        'adchpp.sysuser'
        'http://data.gpo.zugaina.org/klondike/net-p2p/adchpp/files/adchpp-2.8.0-fix_config_paths.patch'
        'http://data.gpo.zugaina.org/klondike/net-p2p/adchpp/files/adchpp-2.11.0-fix_cflags.patch'
        'https://dl.dropboxusercontent.com/u/6596386/adchpp-2.9.0-fix_store_files_in_config_dir_access.guard_plugin.patch'
        'https://dl.dropboxusercontent.com/u/6596386/adchpp-2.9.0-fix_log_path.patch')
sha1sums=('5c69f0bda7c5ce17518a10710b35bef07d5a5b1a'
          'd903e8241dec8e6c96b741f52a43a75894471cf7'
          'b834071b7bd39effcdc6bdeaa61f3e877757583b'
          'd8c98ccc13ffda1c68bd1d356f51ae99dd1a5ba2'
          '7f270a8803871e6b25b9ed15d60ba765df9e3741'
          'e2e396e0542df153a312c0b43275a321511d0209'
          '04c2bba95ab80d56a0e56fa9cd3f0b2edce88e23'
          'c201970be161b01d30a4c6761235f47aad9fec4e'
          '1e40351b4be6441979229d63210b43817c9819bf')
install=adchpp.install

[ "$CARCH" = "i686" ] && _arch="x86"
[ "$CARCH" = "x86_64" ] && _arch="x64"

prepare() {
  # Use python2
  mkdir "${srcdir}/python"
  ln -s /usr/bin/python2 "${srcdir}/python/python"
  export PATH="${srcdir}"/python:$PATH

  cd "adchpp_${pkgver}_source"

  # Patch
  patch -p1 -i "${srcdir}/adchpp-2.8.0-fix_config_paths.patch"
  patch -p1 -i "${srcdir}/adchpp-2.11.0-fix_cflags.patch"
  patch -p0 -i "${srcdir}/adchpp-2.9.0-fix_store_files_in_config_dir_access.guard_plugin.patch"
  patch -p0 -i "${srcdir}/adchpp-2.9.0-fix_log_path.patch"
  sed -e "s|%%ADCHPPLIB%%|/usr/lib/adchpp|g" \
      -e "s|%%ADCHPPSHARE%%|/usr/share/adchpp|g" \
      -e "s|%%ADCHPPETC%%|/etc/adchpp|g" \
      -e "s|%%ADCHPPLOG%%|/var/log/adchpp|g" \
      -i etc/adchpp.xml -i etc/Script.xml -i rbutil/adchpp.rb -i pyutil/adchpp.py

  # Ugly patch: set path for volatile files created by lua scripts
  sed -e "/luadchpp.)/a-- set path of volatile files\nlocal varfilepath = \"/var/lib/adchpp/\"\n" \
      -e 's|adchpp.Util_getCfgPath()|varfilepath|g' \
      -i plugins/Script/examples/*lua

  # Dos2Unix
  find -type f -exec perl -pi -e 's/\r\n?/\n/g' "{}" \;

  # Silence build warnings
  sed 's|_BSD_SOURCE|_DEFAULT_SOURCE|g' -i SConstruct
}

build() {
  cd "adchpp_${pkgver}_source"
  scons -j"$(nproc)" mode=release docs=yes ssl=yes langs=all tools=default systemboost=yes ruby=ruby arch="${_arch}" #systemlua=yes lua=lua5.1
}

package() {
  cd "adchpp_${pkgver}_source"

  install -Dm755 ../adchpp.sh "${pkgdir}/usr/bin/adchpp"
  install -Dm755 "build/release-default-${_arch}/bin/adchppd" "${pkgdir}/usr/lib/adchpp/adchpp"

  (cd "build/release-default-${_arch}/bin"; for i in $(find . -maxdepth 1 -type f -name "*.so"); do install -Dm755 "${i}" "${pkgdir}/usr/lib/adchpp/${i}"; done)

  install -Dm755 linux/generate_certs.sh "${pkgdir}/usr/share/adchpp/generate_certs.sh"

  install -d "${pkgdir}/etc/adchpp/certs/trusted"

  install -Dm644 etc/adchpp.xml "${pkgdir}/etc/adchpp/adchpp.xml"
  install -Dm644 etc/Script.xml "${pkgdir}/etc/adchpp/Script.xml"

  (cd plugins/Script/examples; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/adchpp/scripts/${i}"; done)
  for i in $(find pyutil rbutil -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/adchpp/${i}"; done

  (cd build/docs; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/adchpp/${i}"; done)

  install -Dm644 ../adchpp.service "${pkgdir}/usr/lib/systemd/system/adchpp.service"
  install -Dm644 ../adchpp.tmpfile "${pkgdir}/usr/lib/tmpfiles.d/adchpp.conf"
  install -Dm644 ../adchpp.sysuser "${pkgdir}/usr/lib/sysusers.d/adchpp.conf"
}
