# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=mcommander-bin
pkgver=6.1.0
pkgrel=1
pkgdesc='Twin-panel text-mode file manager with loadable panel plugins (binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/blue-panels/mcommander'
license=('GPL-3.0-or-later')
depends=('glib2' 'slang' 'gpm' 'e2fsprogs' 'file')
optdepends=('libssh2: SFTP panel'
            'curl: S3 and FTP panels'
            'smbclient: Samba panel'
            'libarchive: archive panel'
            'mongo-c-driver: MongoDB panel'
            'sqlite: SQLite panel'
            'lua: Lua runtime (pictures, markdown and PDF in the viewer)'
            'git: the Git panel'
            'docker: the Docker panel'
            'kubectl: the Kubernetes panel'
            'openssh: shell links where libssh2 cannot serve the host'
            'chafa: pictures in the terminal'
            'poppler: text and pages of a PDF'
            'groff: man pages and nroff text in the viewer'
            'man-db: man pages in the viewer'
            'python: three of the extfs helpers'
            'libx11: keyboard modifiers under X'
            'aspell: spell checking in the editor'
            'hunspell: spell checking in the editor'
            'ctags: the tag index the editor reads')
provides=('mcommander' 'mcommander-plugins' 'mcommander-lua' 'mc6')
conflicts=('mcommander' 'mcommander-plugins' 'mcommander-lua' 'mc6')
backup=(etc/mcommander/{ctags.keymap,edit.indent.rc,extensions.ini,filehighlight.ini,keymap.default.ini,keymap.emacs.ini,keymap.ini,keymap.vim.ini,mcedit.menu,panels.ftp.ini,panels.git.ini,sfs.ini,spell.keymap})
options=('!strip' '!debug')
_dl="$url/releases/download/v$pkgver"
source=("COPYING-$pkgver::https://raw.githubusercontent.com/blue-panels/mcommander/v$pkgver/doc/COPYING")
# Upstream ships Arch packages for x86_64 only; aarch64 uses the Debian 13 build.
source_x86_64=("$_dl/mcommander-$pkgver-1-x86_64.pkg.tar.zst"
               "$_dl/mcommander-plugins-$pkgver-1-x86_64.pkg.tar.zst"
               "$_dl/mcommander-lua-$pkgver-1-x86_64.pkg.tar.zst")
source_aarch64=("$_dl/mcommander_$pkgver-1.debian13.1_arm64.deb"
                "$_dl/mcommander-plugins_$pkgver-1.debian13.1_arm64.deb"
                "$_dl/mcommander-lua_$pkgver-1.debian13.1_arm64.deb")
noextract=("${source_x86_64[@]##*/}" "${source_aarch64[@]##*/}")
sha256sums=('b5dd368a3d4bd908e7269cc01ab6f7953bfa9a100d0c764f87af13b8c89308ed')
sha256sums_x86_64=('ef7db4dc382d44cdf169c21da5225f5e42de571c5c6fb55c6e716ad05dfa0f11'
                   'ed0a9c7201f97a0ebaa7d57fc19f028cc497353b7828e3a1b2f3c670fd58ae23'
                   'bff3923043ee81960e68832ccf6122e898afc64c95af250d7e8bc5a4e47f23db')
sha256sums_aarch64=('4b4132e3bd6f9af5ca6d3f8799f2c71741320a8af78b22ee1ea7e121a69f183b'
                    'e5d2ac4c5b4522823ce5cfa7c69715983902d1019b9bdffde02347c2fe9b951d'
                    'df7e82efa6cd9e89ef29c445152617cb8c27eb89ad6a1e36fae9cf36d3e91f9e')

package() {
    local f
    if [[ $CARCH == x86_64 ]]; then
        for f in "${source_x86_64[@]##*/}"; do
            bsdtar -xf "$f" -C "$pkgdir" --exclude '.*' --exclude 'usr/share/licenses'
        done
    else
        for f in "${source_aarch64[@]##*/}"; do
            bsdtar -xOf "$f" 'data.tar.*' | bsdtar -xf - -C "$pkgdir"
        done
        rm -rf "$pkgdir"/usr/share/{lintian,doc/mcommander-*}
        rm -f "$pkgdir"/usr/share/doc/mcommander/{copyright,changelog.Debian.gz}
    fi
    install -Dm644 "COPYING-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
