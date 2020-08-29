# Maintainer: Franc[e]sco <lolisamurai@tfwno.gf>

_pkgbase=matrix-appservice-irc
pkgname=${_pkgbase}-externalsasl-git
pkgver=r3223.8a631622
pkgrel=1
pkgdesc='Node.js IRC bridge for Matrix, patched with external SASL authentication'
arch=('any')
license=('Apache-2.0')
depends=('nodejs')
conflicts=("$_pkgbase")
provides=("matrix-appservice-irc")
makedepends=('git' 'npm' 'python')
optdepends=('python-urllib3: for grant-ops-in-room.py, migrate-users.py, remove-idle-users.py and remove-user.py'
            'python-requests: for grant-ops-in-room.py, migrate-users.py, remove-idle-users.py and remove-user.py'
            'python-yaml: for grant-ops-in-room.py, migrate-users.py and remove-user.py')
backup=("etc/${_pkgbase}/config.yaml" "etc/${_pkgbase}/provisioning.rules.yaml")
install=${pkgname}.install
url='https://github.com/Francesco149/matrix-appservice-irc/tree/external-sasl'
source=("git+https://github.com/Francesco149/matrix-appservice-irc.git#branch=external-sasl")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
  sed -e "
    s!\./provisioning\.rules\.yaml!/etc/$_pkgbase/provisioning.rules.yaml!g;
    s!\(debug\|errors\)\.log!/etc/$_pkgbase/&!g;
    s!passkey\.pem!/etc/$_pkgbase/&!g;
    s!postgres://username:password@host:port/databasename!nedb:///etc/$_pkgbase/$_pkgbase.db!g;
    " -i config.sample.yaml
}

build() {
  cd "$srcdir/$_pkgbase"
  npm install --cache "${srcdir}"/npm-cache
}

package() {
  cd "$srcdir/$_pkgbase"
  # removing unneeded files and directories
  find node_modules -type f \
          \( \
         -iname '*Makefile*' -o \
         -iname '*appveyor.yml' -o \
         -iname '*.babelrc' -o \
         -iname '*.bak' -o \
         -iname '*bower.json' -o \
         -iname '*.c' -o \
         -iname '*.cc' -o \
         -iname '*.cpp' -o \
         -iname '*.md' -o \
         -iname '*.markdown' -o \
         -iname '*.rst' -o \
         -iname '*.nycrc' -o \
         -iname '*.npmignore' -o \
         -iname '*.editorconfig' -o \
         -iname '*.el' -o \
         -iname '*.eslintignore' -o \
         -iname '*.eslintrc*' -o \
         -iname '*.fimbullinter.yaml' -o \
         -iname '*.gitattributes' -o \
         -iname '*.gitmodules' -o \
         -iname '*.h' -o \
         -iname '*.html' -o \
         -iname '*.jshintrc' -o \
         -iname '*.jscs.json' -o \
         -iname '*.log' -o \
         -iname '*logo.svg' -o \
         -iname '*.nvmrc' -o \
         -iname '*.o' -o \
         -iname '*package-lock.json' -o \
         -iname '*.travis.yml' -o \
         -iname '*.prettierrc' -o \
         -iname '*.sh' -o \
         -iname '*.tags*' -o \
         -iname '*.tm_properties' -o \
         -iname '*.wotanrc.yaml' -o \
         -iname '*tsconfig.json' -o \
         -iname '*yarn.lock' \
         \) \
         -delete
  find node_modules -type d \
          \( \
         -iwholename '*.github' -o \
         -iwholename '*.tscache' -o \
         -iwholename '*/man' -o \
         -iwholename '*/test' -o \
         -iwholename '*/scripts' -o \
         -iwholename '*/git-hooks' \
         \) \
         -exec rm -rvf {} +
  find node_modules -empty -type d -delete
  install -vdm 755 "${pkgdir}/usr/lib/node_modules/${_pkgbase}/"
  # copy vendored modules, lib and entry point
  cp -av {lib,node_modules,app.js,config.schema.yml} "${pkgdir}/usr/lib/node_modules/${_pkgbase}/"
  # configuration
  install -vDm 640 config.sample.yaml "${pkgdir}/etc/${_pkgbase}/config.yaml"
  install -vDm 640 provisioning.rules.sample.yaml \
    "${pkgdir}/etc/${_pkgbase}/provisioning.rules.yaml"
  # python scripts
  install -vDm 755 scripts/{grant-ops-in-room,migrate-users,remove-idle-users,remove-user}.py \
    -t "${pkgdir}/usr/bin"
  # add nodejs based scripts (which are location dependent)
  install -vDm 755 scripts/{migrate-db-to-pgres.sh,unbridge.js} \
    -t "${pkgdir}/usr/lib/node_modules/${_pkgbase}/scripts"
  # docs
  install -vDm 644 {CHANGELOG,CONTRIBUTING,HOWTO,README}.md \
    -t "${pkgdir}/usr/share/doc/${_pkgbase}"
}
