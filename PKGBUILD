# Maintainer: Jan Hicken <firstname [dot] lastname [at] informatik [dot] uni-hamburg [dot] de>
pkgbase=renew
pkgname=("${pkgbase}-base"
         "${pkgbase}-fa-base"
         "${pkgbase}-faformalism"
         "${pkgbase}-fs"
         "${pkgbase}-guiprompt"
         "${pkgbase}-imagenetdiff"
         "${pkgbase}-jgit"
         "${pkgbase}-refactoring"
         "${pkgbase}-svn"
         "${pkgbase}-tablet"
         "${pkgbase}-xrn")
pkgver=2.5
pkgrel=1
declare -Ag _pkgvers
_pkgvers[${pkgbase}-base]=$pkgver
_pkgvers[${pkgbase}-fa-base]=0.7
_pkgvers[${pkgbase}-faformalism]=0.1
_pkgvers[${pkgbase}-fs]=1.3
_pkgvers[${pkgbase}-guiprompt]=1.3
_pkgvers[${pkgbase}-imagenetdiff]=0.5
_pkgvers[${pkgbase}-jgit]=4.0.0
_pkgvers[${pkgbase}-refactoring]=0.3
_pkgvers[${pkgbase}-svn]=1.8.8
_pkgvers[${pkgbase}-tablet]=0.3
_pkgvers[${pkgbase}-xrn]=0.1
pkgdesc='The Reference Net Workshop'
arch=('any')
url='http://renew.de/'
license=('LGPL')
groups=("$pkgbase")
depends=('java-environment>=7' 'bash')
_baseurl="http://www.informatik.uni-hamburg.de/TGI/${pkgbase}/${pkgver}"
source=("$_baseurl/${pkgbase}${pkgver}base.zip"
        'fix-desktop-file.patch'
        'renew.sh'
        'compilestub.sh'
        'makestub.sh'
        'loadrenew.sh'
        'jcompile.sh')
noextract=()
for subpkg in ${pkgname[*]}; do
  # skip base package
  if [[ $subpkg == ${pkgbase}-base ]]; then 
    continue
  fi

  if [[ $subpkg == ${pkgbase}-jgit || $subpkg == ${pkgbase}-svn ]]; then
    local filename="${subpkg/renew-/}-${pkgver}_${_pkgvers[$subpkg]}.zip"
  else
    local filename="${subpkg/renew-/}-${pkgver}_${_pkgvers[$subpkg]}.jar"
    noextract+=("$filename")
  fi

  source+=("$_baseurl/plugins${pkgver}/$filename")
done
sha256sums=('facc2726120c52fecb84540b1d53d20513a4fe2d0d57c547c624072a79d9797b'
            'a4ec6bfc6eb1770a9eacf0791f7c737d3559efbb98a4caecee030af924108d59'
            'dbe0b1ee17634d98d0b8b8ef7f862d6b56421ae6d92867800e4a00cf0ff3d17d'
            'e33ece1a400120aa4a11915f881b413adc6aa958be889e2fb7a55aaf44ab4b60'
            '9ad46fc4ecf80d7ceea5afc4f95c91d0995f605315075d4735e6f0980509082d'
            'f2da435e28be3424e13147681854173f193e9e1a34f7e5217ecbae503012e073'
            '96cf02bcf6e262e42740602bdbf893a0d0902f385035a20c9baf41659d955e8a'
            '1fb3721546f20053e9914b49f23badae7363af757a79b06f4d76f8ce6bf8a93a'
            '3c95d6fd05b6c4b33184dfa94b11b3376ed3593b622c042fe1db484c6da357e5'
            'cb2370cbc0e9c379985dde604efde934ed8a0d1e882a26c6a50a8c335fa17641'
            'f0d28287a7310b668fcf00421d6147ac6b59d3147d7ebe03fbf9d2d9d2a60584'
            'f42fe37dc61613b372700906b57db11eebd3c3cc36de0d7eb5451f82d25f6062'
            '7b1b4cada39029333e705691ce736565574f12ebede282c8c28df18c22ce5b29'
            '722253392cd0940eb2f6d9a219a106f50efc6d3937977f1ab72f896656dd838d'
            '959a2b5d3ff8bd6f2bd9fdbbf1217a56f49f5b90f3094636a44635002c6058b6'
            '45fa21c98267d8b74d90e7290d235b22cce855163cca919fda838b5c122ff183'
            '3d67e03f6e5cea7b9a2ecdf90f7ff1791ad245a7671de23cad068e8f7c637b11')

package_renew-base() {
  install -D compilestub.sh "${pkgdir}/usr/bin/compilestub"
  install -D jcompile.sh "${pkgdir}/usr/bin/jcompile"
  install -D loadrenew.sh "${pkgdir}/usr/bin/loadrenew"
  install -D makestub.sh "${pkgdir}/usr/bin/makestub"
  install -D renew.sh "${pkgdir}/usr/bin/renew"

  cd ${pkgbase}${pkgver}

  install -Dm 0644 bin/unix/freedesktop/Renew.desktop "${pkgdir}/usr/share/applications/${pkgbase}.desktop"
  install -Dm 0644 bin/unix/freedesktop/renew.xml "${pkgdir}/usr/share/mime/packages/${pkgbase}.xml"

  install -d "${pkgdir}/usr/share/icons/hicolor"
  cp -dR bin/unix/freedesktop/icons/* "${pkgdir}/usr/share/icons/hicolor/"
  find "${pkgdir}/usr/share/icons/hicolor" -type f -print0 | xargs -0 chmod 0644

  install -d "${pkgdir}/usr/share/java/${pkgbase}"
  cp -dR config libs loader.jar plugins "${pkgdir}/usr/share/java/${pkgbase}/"
  find "${pkgdir}/usr/share/java/${pkgbase}" -type f -print0 | xargs -0 chmod 0644

  install -d "${pkgdir}/usr/share/doc/${pkgbase}"
  cp -dR doc/* samples "${pkgdir}/usr/share/doc/${pkgbase}/"
  find "${pkgdir}/usr/share/doc/${pkgbase}" -type f -print0 | xargs -0 chmod 0644
}

package_renew-fa-base() {
  pkgdesc='The Reference Net Workshop - Finite Automata Plug-in'
  depends=("${pkgbase}-base")

  local filename="${pkgname/renew-/}-${pkgver}_${_pkgvers[$pkgname]}.jar"
  install -Dm 0644 ${filename} "${pkgdir}/usr/share/java/${pkgbase}/plugins/${filename}"
}

package_renew-faformalism() {
  pkgdesc='The Reference Net Workshop - FAFormalism Plug-in'
  depends=("${pkgbase}-base")

  local filename="${pkgname/renew-/}-${pkgver}_${_pkgvers[$pkgname]}.jar"
  install -Dm 0644 ${filename} "${pkgdir}/usr/share/java/${pkgbase}/plugins/${filename}"
}

package_renew-fs() {
  pkgdesc='The Reference Net Workshop - Feature Structure Plug-in'
  depends=("${pkgbase}-base")

  local filename="${pkgname/renew-/}-${pkgver}_${_pkgvers[$pkgname]}.jar"
  install -Dm 0644 ${filename} "${pkgdir}/usr/share/java/${pkgbase}/plugins/${filename}"
}

package_renew-guiprompt() {
  pkgdesc='The Reference Net Workshop - GUI Prompt Plug-in'
  depends=("${pkgbase}-base")

  local filename="${pkgname/renew-/}-${pkgver}_${_pkgvers[$pkgname]}.jar"
  install -Dm 0644 ${filename} "${pkgdir}/usr/share/java/${pkgbase}/plugins/${filename}"
}

package_renew-imagenetdiff() {
  pkgdesc='The Reference Net Workshop - ImageNetDiff Plug-in'
  depends=('imagemagick' "${pkgbase}-base")

  local filename="${pkgname/renew-/}-${pkgver}_${_pkgvers[$pkgname]}.jar"
  install -Dm 0644 ${filename} "${pkgdir}/usr/share/java/${pkgbase}/plugins/${filename}"
}

package_renew-jgit() {
  pkgdesc='The Reference Net Workshop - JGitLibs Plug-in'
  depends=("${pkgbase}-base")

  install -d "${pkgdir}/usr/share/java/${pkgbase}/plugins"
  cp -dR ${pkgname/renew-/}-${pkgver}_${_pkgvers[$pkgname]} "${pkgdir}/usr/share/java/${pkgbase}/plugins"
}

package_renew-refactoring() {
  pkgdesc='The Reference Net Workshop - Refactoring Plug-in'
  depends=("${pkgbase}-base")

  local filename="${pkgname/renew-/}-${pkgver}_${_pkgvers[$pkgname]}.jar"
  install -Dm 0644 ${filename} "${pkgdir}/usr/share/java/${pkgbase}/plugins/${filename}"
}

package_renew-svn() {
  pkgdesc='The Reference Net Workshop - SvnLibs Plug-in'
  depends=("${pkgbase}-base")
  
  install -d "${pkgdir}/usr/share/java/${pkgbase}/plugins"
  cp -dR ${pkgname/renew-/}-${pkgver}_${_pkgvers[$pkgname]} "${pkgdir}/usr/share/java/${pkgbase}/plugins"
}

package_renew-tablet() {
  pkgdesc='The Reference Net Workshop - Tablet Plug-in'
  depends=("${pkgbase}-base")  

  local filename="${pkgname/renew-/}-${pkgver}_${_pkgvers[$pkgname]}.jar"
  install -Dm 0644 ${filename} "${pkgdir}/usr/share/java/${pkgbase}/plugins/${filename}"
}

package_renew-xrn() {
  pkgdesc='The Reference Net Workshop - XRN Plug-in'
  depends=("${pkgbase}-base")

  local filename="${pkgname/renew-/}-${pkgver}_${_pkgvers[$pkgname]}.jar"
  install -Dm 0644 ${filename} "${pkgdir}/usr/share/java/${pkgbase}/plugins/${filename}"
}
# vim:set ft=sh ts=2 sw=2 et:
