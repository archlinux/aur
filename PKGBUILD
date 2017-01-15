# Maintainer:

pkgname=adchpp-lan-bzr
pkgver=702
pkgrel=1
pkgdesc="ADC protocol hub made by the people behind DC++ and modified for use at lan parties. (Bazaar Version)"
url="http://dc4lan.sourceforge.net/"
arch=('i686' 'x86_64')
license=("GPL")
depends=('ruby'
         'python2'
         )
makedepends=('scons'
             'swig'
             'bzr'
             'asciidoc'
             )
provides=('adchpp-lan')
conflicts=('adchpp-lan')
backup=('etc/adchpp-lan/Script.xml'
        'etc/adchpp-lan/adchpp.xml'
        )
source=('adhpp-lan::bzr+https://code.launchpad.net/~dc4lan/adchpp-lan/trunk'
        'adchpp-lan.sh'
        'adchpp-lan-bzr.service'
        'adchpp-lan-bzr.tmpfile'
        'adchpp-lan-bzr.sysuser'
        'http://data.gpo.zugaina.org/klondike/net-p2p/adchpp-lan/files/adchpp-lan-2.8.0-fix_config_paths.patch'
        'http://data.gpo.zugaina.org/klondike/net-p2p/adchpp-lan/files/adchpp-lan-2.9.0-fix_cflags.patch'
        'https://dl.dropboxusercontent.com/u/6596386/adchpp-2.9.0-fix_store_files_in_config_dir_access.guard_plugin.patch'
        'https://dl.dropboxusercontent.com/u/6596386/adchpp-2.9.0-fix_log_path.patch'
        )
sha256sums=('SKIP'
            '3d2a86fefc42ad585cf0f07cce35013cd9e101d74bdd023dd745a9b23a04dd8d'
            '94504789a526aeb7abd0318a6fe94c82ae5e987ad5af488919dffc37fd8d8e4b'
            '752430b16d7001fae6b0db3c06543a70237ee34f800564797a1706c2a43921f5'
            'e8f3b35aa02313149f17f36a74f3a3ec2899a3abb02509c85b0ac35c8faa891e'
            '7a112f77e3d995a102703b85230610643f69cd4f99b35fcb22c3edc7c5e7a85b'
            'c0b8b3c47fd2cc64b56f0b6c1c4e4869649b91e0469768215f47bca528beec8c'
            '682ead52a680847550d65c96b4008a32252977e55cb1a904eadb60c565a3b248'
            '7e0f8a76678e9ddd598217f2de6d38261540b03208474ebca6c928c4f563c703'
            )

install="adchpp-lan-bzr.install"

[ "$CARCH" = "i686" ] && _arch="x86"
[ "$CARCH" = "x86_64" ] && _arch="x64"

pkgver() {
  cd adchpp-lan
  echo "$(bzr revno)"
}

prepare() {
  cd adchpp-lan

  # Use python2
  rm -rf "${srcdir}/python"
  mkdir "${srcdir}/python"
  ln -s /usr/bin/python2 "${srcdir}/python/python"
  export PATH="${srcdir}"/python:$PATH

  # Patch
  patch -p1 -i "${srcdir}/adchpp-lan-2.8.0-fix_config_paths.patch"
  patch -p1 -i "${srcdir}/adchpp-lan-2.9.0-fix_cflags.patch"
  patch -p0 -i "${srcdir}/adchpp-2.9.0-fix_store_files_in_config_dir_access.guard_plugin.patch"
  patch -p0 -i "${srcdir}/adchpp-2.9.0-fix_log_path.patch"
  sed -e "s|%%ADCHPPLIB%%|/usr/lib/adchpp-lan|g" \
      -e "s|%%ADCHPPSHARE%%|/usr/share/adchpp-lan|g" \
      -e "s|%%ADCHPPETC%%|/etc/adchpp-lan|g" \
      -e "s|%%ADCHPPLOG%%|/var/log/adchpp-lan|g" \
      -i etc/adchpp.xml \
      -i etc/Script.xml \
      -i rbutil/adchpp.rb \
      -i pyutil/adchpp.py

  # Ugly patch: set path for volatile files created by lua scripts
  sed -e "/luadchpp.)/a-- set path of volatile files\nlocal varfilepath = \"/var/lib/adchpp-lan/\"\n" \
      -e 's|adchpp.Util_getCfgPath()|varfilepath|g' \
      -i plugins/Script/examples/*lua

  # Dos2Unix
  find -type f -exec perl -pi -e 's/\r\n?/\n/g' "{}" \;

  # Silence build warnings
  sed 's|_BSD_SOURCE|_DEFAULT_SOURCE|g' -i SConstruct
}

build() {
  cd adchpp-lan
  scons -j"$(nproc)" mode=release docs=yes ssl=yes langs=all tools=default arch="${_arch}"
}

package() {
  cd adchpp-lan

  install -Dm755 ../adchpp-lan.sh "${pkgdir}/usr/bin/adchpp-lan"
  install -Dm755 "build/release-default-${_arch}/bin/adchppd" "${pkgdir}/usr/lib/adchpp-lan/adchpp"

  pushd "build/release-default-${_arch}/bin" &> /dev/null
  for i in $(find . -maxdepth 1 -type f -name "*.so"); do install -Dm755 "${i}" "${pkgdir}/usr/lib/adchpp-lan/${i}"; done
  popd &> /dev/null

  install -Dm755 linux/generate_certs.sh "${pkgdir}/usr/share/adchpp-lan/generate_certs.sh"

  install -d "${pkgdir}/etc/adchpp-lan/certs/trusted"

  install -Dm644 etc/adchpp.xml "${pkgdir}/etc/adchpp-lan/adchpp.xml"
  install -Dm644 etc/Script.xml "${pkgdir}/etc/adchpp-lan/Script.xml"

  pushd plugins/Script/examples &> /dev/null
  for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/adchpp-lan/scripts/${i}"; done
  popd &> /dev/null
  for i in $(find pyutil rbutil -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/adchpp-lan/${i}"; done

  pushd build/docs &> /dev/null
  for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/adchpp-lan/${i}"; done
  popd &> /dev/null

  install -Dm644 ../adchpp-lan-bzr.service "${pkgdir}/usr/lib/systemd/system/adchpp-lan.service"
  install -Dm644 ../adchpp-lan-bzr.tmpfile "${pkgdir}/usr/lib/tmpfiles.d/adchpp-lan.conf"
  install -Dm644 ../adchpp-lan-bzr.sysuser "${pkgdir}/usr/lib/sysusers.d/adchpp-lan.conf"
}
