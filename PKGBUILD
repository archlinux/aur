# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ansible-language-server
pkgver=1.2.0
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
sha512sums=('2599933f99ec3a6fcdc138a4e07ebceec245eb09029939d9345df79d3c437830416d01b3e8888fefbaab6ee98493a21e60cc2797940b9eaab1288a476fcfc821')
b2sums=('4570765d63af6bdd85ff612b75ce90c962e66f393976c9f42e83157116501a4bf1283c1c83eb5131a977a6ba0af0c0eb995dd14c087e8f2ffc0aeb4bf65b5c2b')

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
