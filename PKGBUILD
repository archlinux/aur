# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ansible-language-server
pkgver=1.0.5
pkgrel=1
pkgdesc="Ansible Language Server"
arch=(any)
url="https://github.com/ansible/ansible-language-server"
license=(MIT)
depends=(ansible nodejs)
makedepends=(npm)
checkdepends=(
  acme-tiny
  ansible-lint
  python-argcomplete
  python-boto3
  python-dnspython
  python-keyring
  python-ldap
  python-openstacksdk
  python-ovirt-engine-sdk
  python-proxmoxer
  python-pynetbox
  python-pyopenssl
  python-github3py
  yamllint
)
optdepends=(
  'ansible-lint: for Ansible linting support'
  'yamllint: for YAML linting support'
)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('de21e7e702af580c9bd5e607a0b8ecd322cbc47a490944ff761d636e7da236707cb60ddfcde69abd3becd61688be41929a6557d4e140e6152a3130940f8ca5ec')
b2sums=('c8819f29ab4f3b95c096f1d67c0eb97bc5e281c58cfa14ae9d5a02c8227ee440a56f36f1a971917b083654a7587e491bee524adf65dd5dbd331dfc292263c081')

build() {
  cd $pkgname-$pkgver
  npm install --cache "$srcdir"/npm-cache
}

check() {
  cd $pkgname-$pkgver
  # npm audit
  # NOTE: lots of failing tests (some due to container requirements)
  # npm test
}

package() {
  local find_files=(
    -iname '*Makefile*' -o
    -iname '*appveyor.yml' -o
    -iname '*.babelrc' -o
    -iname '*.bak' -o
    -iname '*bower.json' -o
    -iname '*.c' -o
    -iname '*.cc' -o
    -iname '*.cpp' -o
    -iname '*.md' -o
    -iname '*.markdown' -o
    -iname '*.rst' -o
    -iname '*.nycrc' -o
    -iname '*.npmignore' -o
    -iname '*.editorconfig' -o
    -iname '*.el' -o
    -iname '*.eslintignore' -o
    -iname '*.eslintrc*' -o
    -iname '*.fimbullinter.yaml' -o
    -iname '*.gitattributes' -o
    -iname '*.gitignore' -o
    -iname '*.gitmodules' -o
    -iname '*.h' -o
    -iname '*.html' -o
    -iname '*.jshintrc' -o
    -iname '*.jscs.json' -o
    -iname '*.log' -o
    -iname '*logo.svg' -o
    -iname '*.nvmrc' -o
    -iname '*.o' -o
    -iname '*package-lock.json' -o
    -iname '*.travis.yml' -o
    -iname '*.prettierrc' -o
    -iname '*.sh' -o
    -iname '*.tags*' -o
    -iname '*.tm_properties' -o
    -iname '*.wotanrc.yaml' -o
    -iname '*tsconfig.json' -o
    -iname '*yarn.lock'
  )
  local find_dirs=(
    -iwholename '*.github' -o
    -iwholename '*.idea' -o
    -iwholename '*.tscache' -o
    -iwholename '*/man' -o
    -iwholename '*/test' -o
    -iwholename '*/scripts' -o
    -iwholename '*/git-hooks'
  )
  cd $pkgname-$pkgver
  # remove unneeded files
  find node_modules -type f \( "${find_files[@]}" \) -delete
  find node_modules -type d \( "${find_dirs[@]}" \) -exec rm -rvf {} +
  find node_modules -empty -type d -delete
  install -vdm 755 "$pkgdir/usr/lib/node_modules/$pkgname/"
  # copy vendored modules, lib and entry point
  cp -av {bin,docs,out,src,node_modules,package.json} "$pkgdir/usr/lib/node_modules/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vdm 755 "$pkgdir/usr/bin/"
  ln -sv /usr/lib/node_modules/$pkgname/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
}
