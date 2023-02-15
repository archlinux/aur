# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ansible-language-server
pkgver=1.0.4
pkgrel=2
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
sha512sums=('1ca507e7e558becfb69e31ac587c2282cc8d25d6bf5dcabca4bded785cde089b02b455f687e0aa3a7f4f30f49016cec87389eb0172dc094f7fa7b366092ca3ef')
b2sums=('3fb0a73d8371e97467642d00228af2290b9f02f1f17789a5f17ff2073737080daf319ccb30f97738c4de97c67347a70b0d850043371ac982dc526067b06f9da8')

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
