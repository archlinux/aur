# Maintainer: dryes <joswiseman@cock.li>
pkgname='pyrescene-hg'
pkgver=423.d5037d93293c
pkgrel=1
pkgdesc='pyReScene is a port of ReScene .NET to the Python programming language.'
url='https://bitbucket.org/Gfy/pyrescene'
arch=('any')
license=('MIT', 'Custom')
depends=('python2' 'chromaprint' 'python2-numpy' 'unrar')
makedepends=('mercurial' 'git' 'dos2unix')
conflicts=('awescript' 'rescene-bin' 'resample-bin')

_hgrepo='pyrescene'
_hgroot="${url%/*}"

_gitroot='git://github.com/d2yes/rarlinux.git'
_gitname='rarlinux'

pkgver() {
  cd "$_hgrepo"
  hg tip | head -n1 | tr -d ' ' | cut -d: --output-delimiter=. -f 2,3
}

build() {
  cd "${srcdir}"
  
  msg 'Connecting to hg server...'
  
  if [ -d "${_hgrepo}/.hg" ]; then
    cd "${_hgrepo}" && hg pull -u
  else
    hg clone "${_hgroot}/${_hgrepo}"
  fi
  
  cd "${srcdir}"
  
  msg 'Connecting to GIT server....'
  
  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg 'The local files are updated.'
  else
    git clone "${_gitroot}" "${_gitname}"
  fi
  
  msg 'GIT checkout done or server timeout'
}

package() {
  cd "${srcdir}/${_hgrepo}"
  
  cp 'rescene/srr.py' 'rescene/srr.py~'
  sed -i -r 's|(dest=\"rar_executable_dir\",)|\1 default=\"/opt/rarlinux\",|' 'rescene/srr.py'
  python2 'setup.py' install --root="${pkgdir}"
  mv 'rescene/srr.py~' 'rescene/srr.py'

  cp 'rescene/unrar.py' 'rescene/unrar.py~'
  sed -i -r 's/^(from awescript import unrar)/\#\1/' 'rescene/unrar.py'
  sed -i -r 's|(unrar = )locate_unix\(\)|\1\"/usr/bin/unrar"|g' 'rescene/unrar.py'
  mkdir -p "${pkgdir}/opt/rarlinux"
  python2 'bin/preprardir.py' "${srcdir}/rarlinux" "${pkgdir}/opt/rarlinux"
  mv 'rescene/unrar.py~' 'rescene/unrar.py'

  cp 'awescript/awescript.py' 'awescript/awescript.py~'
  sed -i -r 's|/usr/local/bin/sr([rs])|sr\1|ig' 'awescript/awescript.py'
  sed -i -r 's/(print \"glob.glob \" \+ path)/None\#\1/g' 'awescript/awescript.py'
  dos2unix 'awescript/awescript.py'
  install -D -m755 "awescript/awescript.py" "${pkgdir}/usr/bin/awescript"
  mv 'awescript/awescript.py~' 'awescript/awescript.py'
}
