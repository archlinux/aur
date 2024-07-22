# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=ansible-language-server
_commit=cc5b9cb43fc536f4c05f2d3e55ed4fcb04271088
pkgver=1.2.3
pkgrel=1
pkgdesc='Ansible Language Server'
arch=(any)
url=https://github.com/ansible/vscode-ansible/tree/main/packages/ansible-language-server
license=(MIT)
depends=(
  ansible
  nodejs
)
makedepends=(
  git
  yarn
)
#checkdepends=(
#  acme-tiny
#  ansible-lint
#  npm
#  python-argcomplete
#  python-boto3
#  python-dnspython
#  python-keyring
#  python-ldap
#  python-openstacksdk
#  python-ovirt-engine-sdk
#  python-proxmoxer
#  python-pynetbox
#  python-pyopenssl
#  python-github3py
#  yamllint
#)
optdepends=(
  'ansible-lint: for Ansible linting support'
  'yamllint: for YAML linting support'
)
source=("git+https://github.com/ansible/vscode-ansible.git#commit=$_commit")
sha512sums=('519a6fa279f92818ad9d2d429c92dfa51d44bfd82b14dc959df2d00f8ed2b367ffc055d73fa96f5313f2245658088382983ef61de5950b2552809bc11d8b1112')
b2sums=('8f58ef315c05fe1701bb4912ee73e814c0c06ddf2c37b411fc7c9db054405461984fac5b71b97e8dd78d2017df34113aecdc3dfa94cc850beb3e307c143c80b2')

prepare() {
  cd vscode-ansible
  yarn --immutable
}

build() {
  cd vscode-ansible/packages/$pkgname
  yarn compile
}

# 2 errors
#check() {
#  cd vscode-ansible/packages/$pkgname
#  yarn test-without-ee
#}

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

  cd vscode-ansible
  # remove unneeded files
  yarn workspaces focus --production @ansible/$pkgname
  find node_modules -type f \( "${find_files[@]}" \) -delete
  find node_modules -type d \( "${find_dirs[@]}" \) -exec rm -rvf {} +
  find node_modules -empty -type d -delete

  install -vdm 755 "$pkgdir/usr/lib/node_modules/$pkgname/"
  # copy vendored modules, lib and entry point
  cp -av node_modules "$pkgdir/usr/lib/node_modules/$pkgname/"
  cd packages/$pkgname
  cp -av {bin,out,src,package.json} "$pkgdir/usr/lib/node_modules/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vdm 755 "$pkgdir/usr/bin/"
  ln -sv /usr/lib/node_modules/$pkgname/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
}
