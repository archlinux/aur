# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reposurgeon
pkgver=4.27
pkgrel=2
pkgdesc="Performs surgery on version control repositories."
arch=('x86_64')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoctor' 'go' 'git' 'xmlto')
optdepends=('bitkeeper'
            'bzr'
            'cvs-fast-export'
            'darcs'
            'fossil'
            'git'
            'mercurial'
            'src'
            'subversion')
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        0001-Attempt-at-fixing-GitLab-issue-362-incremental-mirro.patch
        0002-Correct-erroneous-computation-of-remote-size-on-incr.patch)
b2sums=('fa66c68e75595d074c24cd3dfd1c2d4288663e2dacedc6b45259fb006d4d87942b64b24dddeb507ff800c0c0637963238a9605e2c4971cfdcff4a7fe1f4e6e68'
        '077bcbbf94385b47f855d449c47c7aac5e5fa9a5de9fcbbaf4ff8050f143af62be63a4a319f356af311fdeaa7a2e22f6863821c434b6fc31db7b0ae67f25b3ca'
        'a4a593f48624a835e1e18bbeac41d6c961ca87ca52769f3aae2bb5a3de096a31058f4531a2159d42a39940f4eb8174dbb4f1f8f9f7034fd40695462f026a850d')

prepare() {
  cd "$pkgbase-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgbase-$pkgver"

  # Use -j1 so reposurgeon always gets built before options.adoc is needed
  if [ "$(go version | grep gccgo)" ]; then
    make GOFLAGS="" -j1
  else
    make -j1
  fi
}

package_reposurgeon() {
  cd "$pkgbase-$pkgver"

  if [ "$(go version | grep gccgo)" ]; then
    make GOFLAGS="" DESTDIR="$pkgdir" prefix=/usr install
  else
    make DESTDIR="$pkgdir" prefix=/usr install
  fi

  install -dm755 "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm644 reposurgeon-mode.el "$pkgdir/usr/share/emacs/site-lisp"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/reposurgeon/COPYING"
}
