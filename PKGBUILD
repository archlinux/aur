# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=adchpp-hg
pkgver=2.12.1.725.c290861e08cd
pkgrel=1
pkgdesc="ADCH++ is a hub software for the ADC network. (Mercurial Version)"
url='http://adchpp.sourceforge.net'
arch=('x86_64')
license=('GPL')
depends=('ruby'
         'python2'
         'boost-libs'
         ) #'lua51' 'lua51-filesystem' 'lua51-socket'
makedepends=('mercurial'
             'scons'
             'swig'
             'asciidoc'
             )
provides=('adchpp')
conflicts=('adchpp')
backup=('etc/adchpp/Script.xml'
        'etc/adchpp/adchpp.xml'
        )
source=("adchpp::hg+http://hg.code.sf.net/p/adchpp/code"
        'adchpp.sh'
        'adchpp.service'
        'adchpp.tmpfile'
        'adchpp.sysuser'
        'http://data.gpo.zugaina.org/klondike/net-p2p/adchpp/files/adchpp-2.8.0-fix_config_paths.patch'
        'http://data.gpo.zugaina.org/klondike/net-p2p/adchpp/files/adchpp-2.11.0-fix_cflags.patch'
        'adchpp-2.9.0-fix_store_files_in_config_dir_access.guard_plugin.patch'
        'adchpp-2.9.0-fix_log_path.patch'
        )
sha256sums=('SKIP'
            '408dace5cbe39f93b814b517250ba0ca5729f2d01e2183a467c5acdbbefb78f2'
            'a538ea4dbbbf2f0519f28ac070750d951828902d1c7df658718158f85bf7d524'
            '636dd60195cd41255bd7e24b17776dea5e52c10d65037b2742ba1de6ebd9402e'
            'a561c8eeeb9f94518b95a231fdbd12ba35d8099fce4930b445e7a6a618ecc60b'
            '7a112f77e3d995a102703b85230610643f69cd4f99b35fcb22c3edc7c5e7a85b'
            '7ae9129d2c4480c3b82bdfc487adc59bc3025ca924fb6ee3b161373b0c7ca4d7'
            '682ead52a680847550d65c96b4008a32252977e55cb1a904eadb60c565a3b248'
            '7e0f8a76678e9ddd598217f2de6d38261540b03208474ebca6c928c4f563c703'
            )
install=adchpp-hg.install

pkgver() {
  cd adchpp
  _ver="$(cat ${srcdir}/adchpp/adchpp/version.cpp | grep VERSIONSTRING | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.$(hg log -r -1 --template '{rev}.{node|short}\n')"
}

prepare() {
  cd adchpp

  # Use python2
  rm -rf "${srcdir}/python"
  mkdir "${srcdir}/python"
  ln -s /usr/bin/python2 "${srcdir}/python/python"
  export PATH="${srcdir}"/python:$PATH

  # Patch
  patch -p1 -i "${srcdir}/adchpp-2.8.0-fix_config_paths.patch"
  patch -p1 -i "${srcdir}/adchpp-2.11.0-fix_cflags.patch"
  patch -p0 -i "${srcdir}/adchpp-2.9.0-fix_store_files_in_config_dir_access.guard_plugin.patch"
  patch -p0 -i "${srcdir}/adchpp-2.9.0-fix_log_path.patch"
  sed -e "s|%%ADCHPPLIB%%|/usr/lib/adchpp|g" \
      -e "s|%%ADCHPPSHARE%%|/usr/share/adchpp|g" \
      -e "s|%%ADCHPPETC%%|/etc/adchpp|g" \
      -e "s|%%ADCHPPLOG%%|/var/log/adchpp|g" \
      -i etc/adchpp.xml \
      -i etc/Script.xml \
      -i rbutil/adchpp.rb \
      -i pyutil/adchpp.py

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
  cd adchpp
  scons -j"$(nproc)" mode=release docs=yes ssl=yes langs=all tools=default systemboost=yes ruby=ruby arch=x64 #systemlua=yes lua=lua5.1
}

package() {
  cd adchpp

  install -Dm755 ../adchpp.sh "${pkgdir}/usr/bin/adchpp"
  install -Dm755 "build/release-default-x64/bin/adchppd" "${pkgdir}/usr/lib/adchpp/adchpp"

  (cd "build/release-default-x64/bin"; for i in $(find . -maxdepth 1 -type f -name "*.so"); do install -Dm755 "${i}" "${pkgdir}/usr/lib/adchpp/${i}"; done)

  install -Dm755 linux/generate_certs.sh "${pkgdir}/usr/share/adchpp/generate_certs.sh"

  install -d "${pkgdir}/etc/adchpp/certs/trusted"

  install -Dm644 etc/adchpp.xml "${pkgdir}/etc/adchpp/adchpp.xml"
  install -Dm644 etc/Script.xml "${pkgdir}/etc/adchpp/Script.xml"

  (cd plugins/Script/examples ; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/adchpp/scripts/${i}"; done)
  for i in $(find pyutil rbutil -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/adchpp/${i}"; done

  (cd build/docs; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/adchpp/${i}"; done)

  install -Dm644 ../adchpp.service "${pkgdir}/usr/lib/systemd/system/adchpp.service"
  install -Dm644 ../adchpp.tmpfile "${pkgdir}/usr/lib/tmpfiles.d/adchpp.conf"
  install -Dm644 ../adchpp.sysuser "${pkgdir}/usr/lib/sysusers.d/adchpp.conf"
}
