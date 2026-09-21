# Maintainer: sfs <sfslinux@gmail.com>

pkgbase=mcommander-git
pkgname=(mcommander-git mcommander-plugins-git mcommander-lua-git)
pkgver=v6.0.4.r326.e93c603
pkgrel=1
pkgdesc='Modular TUI file manager with a tiny core, based on GNU Midnight Commander (Git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/blue-panels/mcommander'
license=('GPL-3.0-or-later')
makedepends=('git' 'make' 'pkgconf' 'gettext'
             'glib2' 'slang' 'gpm' 'e2fsprogs' 'libssh2' 'curl' 
             #'samba'
             'libarchive' 'file' 
             #'mongo-c-driver' 
             'lua')
options=('!emptydirs')
source=("mcommander::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/mcommander"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-\)g/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/mcommander"
  if [ ! -f configure ]; then
    ./autogen.sh
  fi

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --libdir=/usr/lib \
    --disable-static \
    --with-screen=slang \
    --with-panel-plugins-dir=/usr/lib/mcommander/panel-plugins \
    --with-editor-plugins-dir=/usr/lib/mcommander/editor-plugins \
    --enable-mcterm=yes \
    --enable-lua-plugin=yes \
    --enable-mctree-magic=yes \
--enable-panel-plugin-samba=no \
    --enable-panel-plugin-ftp=yes \
    --enable-panel-plugin-arcmc=yes \
    --enable-panel-plugin-s3=yes \
--enable-panel-plugin-mongo=no \
    --enable-vfs-sftp=yes \
    --enable-panel-plugin-shell-link=yes \
    --enable-shell-ssh2=yes
  make
}

package_mcommander-git() {
  pkgdesc='Modular TUI file manager with a tiny core, based on GNU Midnight Commander (Git version)'
  depends=('glib2' 'slang' 'gpm' 'e2fsprogs' 'file')
  optdepends=('mcommander-plugins-git: panel plugins for FTP, SFTP, S3, Samba, Docker, k8s, MongoDB'
              'mcommander-lua-git: Lua runtime extension and the scripts that use it'
              'aspell: spell checking in the editor'
              'hunspell: spell checking in the editor')
  provides=("mcommander=${pkgver}")
  conflicts=('mcommander' 'mc6' 'mc6-git')
  replaces=('mc6' 'mc6-git')
  backup=('etc/mcommander/ctags.keymap' 'etc/mcommander/edit.indent.rc'
          'etc/mcommander/extensions.ini' 'etc/mcommander/filehighlight.ini'
          'etc/mcommander/keymap.default.ini' 'etc/mcommander/keymap.emacs.ini'
          'etc/mcommander/keymap.ini' 'etc/mcommander/keymap.vim.ini'
          'etc/mcommander/mcedit.menu' 'etc/mcommander/panels.ftp.ini'
          'etc/mcommander/panels.git.ini' 'etc/mcommander/sfs.ini'
          'etc/mcommander/spell.keymap')

  cd "${srcdir}/mcommander"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/mcommander/panel-plugins"
  rm -rf "${pkgdir}/usr/lib/mcommander/runtime-plugins"
  rm -rf "${pkgdir}/usr/share/mcommander/lua"
  find "${pkgdir}" -name '*.la' -delete

  rm -f "${pkgdir}/etc/mcommander/keymap.ini"
  cp "${pkgdir}"/etc/mcommander/keymap{.default,}.ini
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/mcommander/COPYING"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/mcommander/CHANGELOG.md"
}

package_mcommander-plugins-git() {
  pkgdesc='Panel plugins for M-Commander (Git version)'
  depends=("mcommander-git=${pkgver}-${pkgrel}" 'glib2' 'libssh2' 'curl' 
	    #'samba'
           'libarchive' 'file' 
           #'mongo-c-driver'
           )
  provides=("mcommander-plugins=${pkgver}")
  conflicts=('mcommander-plugins' 'mc6-plugins-git')

  cd "${srcdir}/mcommander"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/etc" "${pkgdir}/usr/bin" "${pkgdir}/usr/share"
  find "${pkgdir}/usr/lib/mcommander" -mindepth 1 -maxdepth 1 ! -name panel-plugins \
    -exec rm -rf {} +
  find "${pkgdir}" -name '*.la' -delete
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/mcommander-plugins/COPYING"
}

package_mcommander-lua-git() {
  pkgdesc='Lua runtime extension for M-Commander (Git version)'
  depends=("mcommander-git=${pkgver}-${pkgrel}" 'glib2' 'lua')
  provides=("mcommander-lua=${pkgver}")
  conflicts=('mcommander-lua')

  cd "${srcdir}/mcommander"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/etc" "${pkgdir}/usr/bin"
  find "${pkgdir}/usr/lib/mcommander" -mindepth 1 -maxdepth 1 ! -name runtime-plugins \
    -exec rm -rf {} +
  find "${pkgdir}/usr/share" -mindepth 1 -maxdepth 1 ! -name mcommander -exec rm -rf {} +
  find "${pkgdir}/usr/share/mcommander" -mindepth 1 -maxdepth 1 ! -name lua -exec rm -rf {} +
  find "${pkgdir}" -name '*.la' -delete
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/mcommander-lua/COPYING"
}
