# Maintainer: hrdl <aur@hrdl.eu>

pkgname=zotero-translation-server-git
pkgver=20221208.0329031
pkgrel=1
pkgdesc='The Zotero translation server lets you use Zotero translators without the Zotero client.'
arch=('x86_64')
url='https://github.com/zotero/translation-server'
license=('AGPL3')
depends=('npm')
makedepends=('git')
_src_dir_1=translation-server
_src_dir_2=translate
_src_dir_3=translators
_src_dir_4=utilities
_src_dir_5=zotero-schema
source=("zotero-translation-server.service"
    "zotero-translation-server.sysusers"
    "zotero-translation-server.tmpfiles"
    "${_src_dir_1}::git+https://github.com/zotero/translation-server"
    "${_src_dir_2}::git+https://github.com/zotero/translate"
    "${_src_dir_3}::git+https://github.com/zotero/translators"
    "${_src_dir_4}::git+https://github.com/zotero/utilities"
    "${_src_dir_5}::git+https://github.com/zotero/zotero-schema")
sha256sums=('325c4c7a4149b65b2c8d7924a849cc1aa30f4597318febc1bb51065f16a38148'
  'd85e56ef2802841a33b44424cbed53b72eb6d26775123fd8c24197f3e5f40c39'
  '474ac53ca5ed1c014030b7014433244aa39f883325fe512a62f9ad56718b2914'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd ${_src_dir_1}
    git log -1 --format='%cd.%h' --date=short |tr -d -
}

prepare() {
  cd ${_src_dir_1}
  sed -i '/"host"/s/0.0.0.0/127.0.0.1/' config/default.json5
  git submodule init
  git config submodule.modules/translate.url "$srcdir/translate"
  git config submodule.modules/translators.url "$srcdir/translators"
  git config submodule.modules/utilities.url "$srcdir/utilities"
  git config submodule.modules/zotero-schema.url "$srcdir/zotero-schema"
  git -c protocol.file.allow=always submodule update

  cd ../${_src_dir_2}
  git submodule init
  git config submodule.modules/utilities.url "$srcdir/utilities"
  git -c protocol.file.allow=always submodule update

  cd ../${_src_dir_4}
  git submodule init
  git config submodule.resource/schema/global.url "$srcdir/zotero-schema"
  git -c protocol.file.allow=always submodule update
}

package() {
  npm install --location global --prefix "$pkgdir"/usr ./"$_src_dir_1" --install-links

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  # Experimental dedup rm -r "$pkgdir"/usr/lib/node_modules/$pkgname/node_modules/{,.bin/}nopt
  rm -r "$pkgdir"/usr/lib/node_modules/"${_src_dir_1}"/node_modules/{,.bin/}semver

  install -d "$pkgdir"/usr/share/licenses/${pkgname%-git}
  ln -s ../../../lib/node_modules/$_src_dir_1/COPYING "$pkgdir"/usr/share/licenses/${pkgname%-git}/LICENSE

  install -Dm 644 "$pkgdir"/usr/lib/node_modules/translation-server/config/default.json5 "$pkgdir/etc/${pkgname%-git}/default.json5"
  install -Dm 644 "$pkgdir"/usr/lib/node_modules/translation-server/config/custom-environment-variables.json "$pkgdir/etc/${pkgname%-git}/custom-environment-variables.json"

  install -Dm 644 "${pkgname%-git}".service \
    "$pkgdir/usr/lib/systemd/system/${pkgname%-git}.service"
  install -Dm 644 zotero-translation-server.sysusers "${pkgdir}"/usr/lib/sysusers.d/zotero-translation-server.conf
  install -Dm 644 zotero-translation-server.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/zotero-translation-server.conf
}
