# Maintainer: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=('seafile-server' 'seafile-client-cli' 'seafile-shared')
pkgver=5.1.1
pkgrel=1
pkgdesc="Seafile is an online file storage and collaboration tool"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/haiwen/seafile/"
license=('GPL3')
makedepends=("vala" "intltool"
             "python2" "sqlite" "fuse"
             "ccnet>=${pkgver}" "libevhtp-seafile=1.2.9")
source=("seafile-server-${pkgver}.tar.gz::https://github.com/haiwen/seafile/archive/v${pkgver}-server.tar.gz"
        "seafile-admin_virtualenv.patch"
        "seafile-server@.service"
        "seahub-preupgrade"
        "create-default-conf-dir.patch"
        "0001-Revert-server-put-pids-folder-out-of-seafile-data.patch"
        "libseafile.in.patch")
sha256sums=('60b5bf6cfc3f65359eada827733eb4c4720535db3c6dc1a37be1c3470f7c7030'
            '52fb29858f6424052cf01630ad72b5687a4fb259f23f9efc97f08be04a883218'
            'ae1ed38f94304d27e4ef1ca66e15d544f99681c1e743c510c54d4a112f050421'
            '2a1e079cbea3543f356e6e9571f3d7d2a4b0ab75131ee417115d738ea191c4fb'
            '6bd632f8741b039bad961af3d6850b651e25b7e7a3018d6e2789f350ff93bb78'
            'b1748e826d8e7cccdd825b99864b74dfb5795312f8878d63e9a87105f4382e29'
            'a2d7f7cf0c59aba97650af62b3cefd0ceb71a1007c34d9369a88e5769c7f6076')

prepare () {
  cd "${srcdir}/seafile-${pkgver}-server"

  patch -p1 -i "${srcdir}/seafile-admin_virtualenv.patch"
  patch -p1 -i "${srcdir}/0001-Revert-server-put-pids-folder-out-of-seafile-data.patch"
  patch -p1 -i "${srcdir}/create-default-conf-dir.patch"
  patch -p1 -i "${srcdir}/libseafile.in.patch"

  # Fix all script's python 2 requirement
  grep -s -l -r '#!/usr/bin/env python' "${srcdir}/seafile-${pkgver}-server" \
    | xargs sed -i -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|g'
}

build() {
  cd "$srcdir/seafile-${pkgver}-server"

  ./autogen.sh

  ./configure \
    --enable-client \
    --enable-fuse \
    --enable-python \
    --enable-server \
    --prefix=/usr \
    PYTHON=/usr/bin/python2

  make
}

package_seafile-client-cli() {
  depends=("seafile-shared" "libevent")
  conflicts=("seafile-shared<${pkgver}")
  pkgdesc="Seafile cli client"

  cd "${srcdir}/seafile-${pkgver}-server"

  # Install cli client
  install -D -m755 app/seaf-cli "${pkgdir}/usr/bin/seaf-cli"
}

package_seafile-shared() {
  depends=("ccnet" "fuse")
  conflicts=("ccnet<${pkgver}")
  pkgdesc="Shared components of Seafile (seafile-daemon, libseafile, python bindings, manuals)"

  cd "${srcdir}/seafile-${pkgver}-server"

  make DESTDIR="${pkgdir}" install

  # Remove server components
  rm -rf "${pkgdir}/usr/bin/seafserv-gc"
  rm -rf "${pkgdir}/usr/bin/seafile-admin"
  rm -rf "${pkgdir}/usr/bin/seaf-fuse"
  rm -rf "${pkgdir}/usr/bin/seaf-server"
  rm -rf "${pkgdir}/usr/bin/seaf-server-init"
  rm -rf "${pkgdir}/usr/bin/seaf-migrate"
  rm -rf "${pkgdir}/usr/bin/seaf-fsck"
  # Remove cli client binary
  rm -rf "${pkgdir}/usr/bin/seaf-cli"
}

package_seafile-server() {
  depends=("seafile-shared" "wget"
           "python2-mako" "python2-dateutil" "python2-webpy" "python2-pip"
           "python2-virtualenv" "python2-flup" "python2-six" "python2-chardet"
           "python2-simplejson" "libevhtp-seafile" "git")
  optdepends=('libmysqlclient: mysql server support' )
  conflicts=("seafile-shared<${pkgver}")
  options=('!libtool' '!emptydirs')
  install=seafile-server.install
  pkgdesc="Seafile server components, without seahub"

  # Install library and header files
  cd "${srcdir}/seafile-${pkgver}-server"
  make DESTDIR="${pkgdir}" install

  # Remove files already installed by seafile-shared
  # to maintain compatibility
  rm -rf "${pkgdir}/usr/lib"
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/share/man"
  rm -rf "${pkgdir}/usr/bin/seaf-daemon"
  rm -rf "${pkgdir}/usr/bin/seafile-controller"

  # Remove seafile-client-cli
  rm -rf "${pkgdir}/usr/bin/seaf-cli"

  # Install all scripts
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r -p "${srcdir}/seafile-${pkgver}-server/scripts" \
    "${pkgdir}/usr/share/$pkgname/scripts"

  # Remove win32 and other distributions specific scripts
  rm -rf "${pkgdir}/usr/share/$pkgname/scripts/build"
  rm -rf "${pkgdir}/usr/share/$pkgname/scripts/upgrade/win32"

  # Install systemd service
  install -D -m644 "${srcdir}/seafile-server@.service" \
    "${pkgdir}/usr/lib/systemd/system/seafile-server@.service"

  # Install seahub preupgrade script
  install -D -m755 "${srcdir}/seahub-preupgrade" \
    "${pkgdir}/usr/bin/seahub-preupgrade"
}
