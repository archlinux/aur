# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=ansible-language-server
pkgver=1.2.1
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
sha512sums=('ab067742ac9365ddbf7587f297ad1733471f75e778f1ecb2f98dd2291fd53d77f3db157d4f07c42fd8b32a450f9730339cb90d937b27f72b8fdcf6759bd0d3a6')
b2sums=('1d93cdd76e49b882187e123b2e3906874e80ba15322e6b7081cf00afb55916d6b68bc0defc69f456dac65081870563daf9dfbde8d498f673981efe7534e46f5a')

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
