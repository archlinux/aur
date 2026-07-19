# Contributor: Luiz Silva <luizsv.dev@gmail.com>
pkgname=devin-desktop
pkgver=3.4.27
pkgrel=2
pkgdesc="A team of agents for every engineer — Devin Desktop"
arch=('x86_64')
url="https://devin.ai/desktop"
license=('LicenseRef-Devin Desktop')
depends=( fd ripgrep xdg-utils
  alsa-lib
  dbus
  gnupg
  libnotify
  libsecret
  libxss
  libxkbfile
)

options=('!strip')  # needed for sig of ext ?

# To update: curl -s https://windsurf-stable.codeium.com/api/update/linux-x64-deb/stable/latest | jq -r '.url,.sha256hash'
_url="https://windsurf-stable.codeiumdata.com/linux-x64-deb/stable/0d4bf12ed4a7597cb8ae9016fe8474468aad98a2/Devin-linux-x64-${pkgver}.deb"
source=("${pkgname}-${pkgver}.deb::$_url"
"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh")
b2sums=('16db93e19459d17b8da85ca5de7d92869f3500fd9fb2e7f2d0432571119f886a248daec9162df9abc0c30dc376aa18ef5c7202777393ff4921b0ab82720ffe4c'
'04759111dcb50b5811a96085fee9384c89a583431a9da510dd06f2675fe80cf7becd5d12bcbdc92c08f16ba6e2093947fc9eb9007827c2e76244cd4be8615946')

prepare() {
  bsdtar xf data.tar.xz --exclude 'usr/share/devin-desktop/[^r]*' --exclude 'usr/share/devin-desktop/*.pak'
  _app=/usr/share/devin-desktop/resources/app
  sed code.sh \
    -e "s|/usr/lib/code/out/cli.js|${_app}/out/cli.js|" \
    -e "s|/usr/lib/code/code.mjs|--app=${_app}|" > run.sh
  ln -svf /usr/bin/fd usr/share/$pkgname/resources/app/extensions/windsurf/bin/fd
  ln -svf /usr/bin/rg usr/share/$pkgname/resources/app/node_modules/@vscode/ripgrep/bin/rg
  ln -svf /usr/bin/xdg-open usr/share/$pkgname/resources/app/node_modules/open/xdg-open
}

package(){
  _electron=electron$(rg -o -r '$1' '"electron": *"[^0-9]*([0-9]+)' usr/share/${pkgname}/resources/app/package.json)
  echo $_electron
  mv usr "${pkgdir}/usr"
  sed "s|name=electron|name=${_electron}|" run.sh > run-e.sh
  install -Dm755 run-e.sh "${pkgdir}/usr/bin/${pkgname}"
  depends+=(${_electron}) # hidden from --printsrcinfo
}
