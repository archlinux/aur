# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# This is tested for CLI usage only, mainly to make the samples work. Enhancements for httpd usage are welcome.
# The samples are working in PHPExcel, PHPWord (without PDF), and PHPProject
# If there is interest I'll post any working packages.

# This is very experimental, both the PKGBUILD and the packages except PHPExcel.
# Don't hardcode much into your programs until we get some feedback from the author on the best install techniques and file layout.

# TODO PHPWord: How to enable PDF generation via DomPDF, MPDF, or TCPDF. A path must be configured somewhere but I don't see where.
#   $pdfRendererPath, $pdfRendererName, $includeFile
# TODO: Package for MPDF http://www.mpdf1.com/mpdf/index.php
# TODO: Package for TCPDF http://www.tcpdf.org/

# TODO: The author needs to implement consistent naming in the app suite PHPExcel, PhpWord, PhpPowerpoint, PhpPowerPoint, ...
# TODO: PHPPowerPoint doesn't work.
# TODO: PHPPowerPoint vendor/autoload.php not supplied. I don't see it in the Common project.

# TODO: Common class String not found. There is one in PHPWord but it doesn't work in Common for PHPPowerPoint.
# TODO: How to properly integrate Common?

# TODO: PHPVisio whenever the first release arrives.

# TODO: Don't automatically enable php extensions. They cause warnings if already enabled and may interfere with web servers.

set -u
_pkgname='PHPExcel'     ; _vopt='' ; pkgver='1.8.2' ; pkgrel='1'
#_pkgname='PHPWord'      ; _vopt='v'; pkgver='0.12.1'; pkgrel='1'
####_pkgname='Common'       ; _vopt='' ; pkgver='0.2.2' ; pkgrel='1' # Don't install this one yet. It's incomplete and only needed for PHPPowerPoint.
####_pkgname='PHPPowerPoint'; _vopt='' ; pkgver='0.4.0' ; pkgrel='1'  # Doesn't work yet due to a missing file String in Common.
#_pkgname='PHPProject'   ; _vopt='' ; pkgver='0.2.0' ; pkgrel='1'
####_pkgname='PHPVisio'     ; _vopt='' ; pkgver='?' ; pkgrel='1' # No release yet
pkgname="php-phpoffice-${_pkgname,,}"
#_gittag='372c7cbb695a6f6f1e62649381aeaa37e7e70b32' # PHPExcel 1.8.1
pkgdesc='read, write and create spreadsheet documents, xls xlsx CSV ods Gnumeric PDF HTML. Included are experimental stubs for PHPWord PHPPowerPoint PHPProject PHPVisio'
arch=('any')
url="https://github.com/PHPOffice/${_pkgname}"
license=('LGPL')
groups=('php-phpoffice')
depends=('php>=5.3.0' 'php-gd' 'php-xsl') # 'dompdf'
optdepends=()
# PHPExcel
# extension zip: included in php but not enabled
# extension xml: enabled by default at compile
# extension gd2: php-gd

# PHPWord
# check dependencies with samples/index.php
# extension zip,xml,gd
# extension xmlwriter: enabled by default at compile
# extension dompdf: AUR php-dompdf

# PHPPowerPoint PHPPresentation
# check dependencies with samples/index.php
# extension zip,xml,gd
# extension xmlwriter: enabled by default at compile
# extension dompdf: AUR php-dompdf

# PHPProject
# check dependencies with samples/index.php
# extension: xml,zip,xmlwriter

# PHPVisio
# ???

makedepends=()
options=('!strip')
install='php-office.install'
_verwatch=("${url}/releases" "${url#*github.com}/archive/${_vopt}\(.*\)\.tar\.gz" 'l')
# The git version of PHPExcel includes some documentation.
source=("${_pkgname,,}-${pkgver}.tar.gz::${url}/archive/${_vopt}${pkgver}.tar.gz")
#source=("${_pkgname}::${url//https:/git:}.git") # #tag=${_gittag}")
sha256sums=('2598ca27212040435748301f967e1bbb2a6ed977a24706d1abf774dcc8d2690b')

case "${_pkgname}" in
  PHPExcel)
    if [ "${source[0]%.git}" != "${source[0]}" ]; then
      # documentation: sphinx, python
      makedepends+=('php-phing' 'zip' 'unzip' 'phpdocumentor2')
    fi
    ;;
  PHPWord) optdepends+=('php-dompdf<0.7.0: PHPWord pdf generation');; # 0.7.0 deprecated dompdf_config.inc.php which PHPWord 0.12.1 requires at this time
  PHPPowerPoint) depends+=('php-phpoffice-common');;
  Common) unset install;;
esac

# PHPExcel: The phar file doesn't work and it's not worth figuring out why. The sources work fine and are easier to control.
_opt_buildphar=0 # Default 0
# Only applies to git version.
# 1 = make phar file
# 0 = leave individual php files

_prepare_PHPExcel() {
  # Make the examples functional
  local IFS=$'\n'
  sed -i -e 's:../Build/:/usr/share/webapps/phpoffice/:g' -- $(grep -rlI '../Build/' 'Examples/')
  sed -i -e "s:dirname(__FILE__) \. '/\.\./Classes/:'/usr/share/webapps/phpoffice/:g" -- $(grep -rlI '/../Classes/' 'Examples/')
  # Fix the bat files for Linux and an automatic build
  if [ -d '.git' ]; then
    #local _chdate="$(grep -m1 '^[0-9-]\{10\} ' changelog.txt | cut -d' ' -f1)" # from the changelog
    local _chdate="$(git log -1 --format='%ci' | cut -d' ' -f1)" # from git
    sed -i -e 's,^@.*$,#!/usr/bin/sh\nexport PATH=.:$PATH,g' \
           -e 's,^phing \(.*\)$'",phing.sh '-d extension=iconv.so -d extension=xsl.so -d include_path=.:/usr/share/pear' -DpackageVersion=${pkgver} -DreleaseDate=${_chdate} -DdocumentFormat=doc \1,g" \
      Build/*.bat
    local _batfile
    for _batfile in Build/*.bat; do
      echo >> "${_batfile}"
    done
    # Place all the dependencies so we can use a simple include path
    ln -sf '/usr/share/webapps/phpdocumentor2' 'Build/phpdocumentor' # a little disagreement on what the name should be
    ln -sf '/usr/share/pear' 'Build/pear'
    chmod 755 Build/*.bat
    cp -p 'Build/build.xml' 'Build/build.xml.Arch'
    expand -t 4 'Build/build.xml.Arch' > 'Build/build.xml'
    rm -f 'Build/build.xml.Arch'
    sed -i -e 's:${phing.dir}'":$(pwd)/Build:g" \
           -e '# Invalid syntax' \
           -e 's:property="${\([a-zA-Z]\+\)}":property="\1":g' \
      'Build/build.xml'
    # The Arch Linux executable is broken but it turns out phing executes phar without running the system executable.
    if ! :; then
      # 2015-09-20 Arch Linux phar is broken. Supply one used by PATH above
        cat > 'Build/phar' << EOF
#!/usr/bin/bash
php -d 'open_basedir=NULL' -d 'phar.readonly=0' -d 'extension=phar.so' '/usr/bin/phar' "\$@"
EOF
      chmod 755 'Build/phar'
    fi
  fi
}

_prepare_PHPWord() {
  ln -sf 'samples' 'Examples'
  ln -sf 'src' 'Classes'
  mv 'src/PhpWord' 'src/PHPWord'
  mv 'src/PHPWord/PhpWord.php' 'src/PHPWord/PHPWord.php'
  sed -i -e "s:__DIR__ \. '/\.\./src/PhpWord/:'/usr/share/webapps/phpoffice/PHPWord/:g" 'samples/Sample_Header.php'
  local IFS=$'\n'
  sed -i -e "s:PhpWord:PHPWord:g" $(grep -rlI 'PhpWord' .)

  # A cheat to enable DomPDF. I did this to make sure all the packages work and as a poor quality demo of how it can be made to work.
  # Hopefully the author will tell us the right way to do this.
  if ! :; then
    sed -i -e 's:^\(\s\+private static \$pdfRendererName\) = .*$:\1 = "DomPDF";:g' \
           -e 's:^\(\s\+private static \$pdfRendererPath\) = .*$:\1 = "/usr/share/webapps/dompdf";:g '\
      'src/PHPWord/Settings.php'
  fi
}

_prepare_Common() {
  # This is a very bad hack to get the PHPPowerPoint samples to work a bit more.
  # Seems like namespaces would prevent this collision and I wouldn't need to change the class name to run two AutoLoaders in the same file.
  # See _prepare_PHPPowerPoint for where this hack is used.
  sed -i -e 's:^class Autoloader$:&Common:g' 'src/Common/Autoloader.php'
}

_prepare_PHPPowerPoint() {
  ln -sf 'samples' 'Examples'
  ln -sf 'src' 'Classes'
  # This file is not supplied and so far appears not necessary. I'll replace it with my hacked Common for now.
  sed -i -e "s@^require_once __DIR__ \. '/\.\./vendor/autoload.php';"'$'"@#&\nuse PhpOffice\\\\Common\\\\AutoloaderCommon;\nrequire_once '/usr/share/webapps/phpoffice/Common/Autoloader.php';\nAutoloaderCommon::register();@g" 'samples/Sample_Header.php'
  sed -i -e "s:__DIR__ \. '/\.\./src/PhpPowerpoint/:'/usr/share/webapps/phpoffice/PHPPowerPoint/:g" 'samples/Sample_Header.php'
  # PHP Fatal error:  Class 'PhpOffice\Common\String' not found in /usr/share/webapps/phpoffice/PHPPowerPoint/Writer/PowerPoint2007/Slide.php on line 905
  # I don't see any string class in Common. It is found in PHPWord. Probably hasn't migrated into Common yet.
  # Copy and modify String.php from PHPWord to Common does *NOT* work.

  # This makes it work much worse!
  if ! :; then
    mv 'src/PhpPowerpoint' 'src/PHPPowerPoint'
    mv 'src/PHPPowerPoint/PhpPowerpoint.php' 'src/PHPPowerPoint/PHPPowerPoint.php'
    local IFS=$'\n'
    sed -i -e "s:PhpPowerPoint:PHPPowerPoint:g" -e "s:PhpPowerpoint:PHPPowerPoint:g" $(grep -rlIF $'PhpPowerPoint\nPhpPowerpoint' .)
  fi
}

_prepare_PHPProject() {
  ln -sf 'samples' 'Examples'
  ln -sf 'src' 'Classes'
  mv 'src/PhpProject' 'src/PHPProject'
  mv 'src/PHPProject/PhpProject.php' 'src/PHPProject/PHPProject.php'
  sed -i -e "s:__DIR__ \. '/\.\./src/PhpProject/:'/usr/share/webapps/phpoffice/PHPProject/:g" 'samples/Sample_Header.php'
  local IFS=$'\n'
  sed -i -e "s:PhpProject:PHPProject:g" -e "s:PhpProject:PHPProject:g" $(grep -rlIF $'PhpProject\nPhpProject' .)
  mkdir -p 'samples/results'
}

prepare() {
  set -u
  cd "${_pkgname}"*/

  # Fix CRLF end of lines
  local IFS=$'\n'
  sed -i -e 's:\r::g' -- $(grep -rlI $'\r$' [A-Za-z]*/) # Modifying the .git folder destroys it. Keep away from the sample pictures too.

  eval "_prepare_${_pkgname}"
  set +u
}

build() {
  set -u
  if [ "${_pkgname}" = 'PHPExcel' ] && cd "${_pkgname}"*/Build/; then
    if [ ! -s "release/${_pkgname}_${pkgver}_doc.zip" ]; then
      ./build-release-standard.bat
    fi
    if [ "${_opt_buildphar}" -ne 0 ] && [ ! -s "release/${_pkgname}_${pkgver}.phar" ]; then
      ./build-release-phar.bat
    fi
# PHPExcel: Unable to build build-release-pear.bat
# .......it depends on Phing_d51PearPkg2Task
# ... which depends on pear-pear-packagefilemanager2
# ... which errors: PHP Fatal error:  Class 'PEAR_PackageFileManager_File' not found in /usr/share/pear/PEAR/PackageFileManager2.php on line 1251
# This would require addons to php-phing
  fi
  set +u
}

# No reason to install the samples. Only root can write to the output folder.
# package for all the release versions
_package_release() {
  cd "${_pkgname}"*/
  if [ -s 'license.md' ]; then
    install -Dpm644 'license.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  else
    install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

  install -d "${pkgdir}/usr/share/webapps/phpoffice"
  if [ -d 'Classes' ]; then
    mv Classes/* "${pkgdir}/usr/share/webapps/phpoffice/"
  fi
      case "${_pkgname}" in
      PHPExcel) ln -sf "${_pkgname}.php" "${pkgdir}/usr/share/webapps/phpoffice/${_pkgname}.phar";;
      PHPWord|PHPPowerPoint|PHPProject)  ln -sf "${_pkgname}/${_pkgname}.php" "${pkgdir}/usr/share/webapps/phpoffice/${_pkgname}.phar";;
      Common) mv 'src/Common' "${pkgdir}/usr/share/webapps/phpoffice/";;
      *) echo "Unsupported package ${_pkgname}"; false;;
      esac
}

# package for git version, only tested for PHPExcel
package() {
  set -u
  if ! cd "${_pkgname}"*/Build/release; then
    _package_release
  else
    local _release="$(pwd)"
    install -d "${pkgdir}/usr/share/webapps/phpoffice/"
    unzip -qod "${pkgdir}/usr/share/webapps/phpoffice/" "${_pkgname}_${pkgver}_doc.zip"

    # Undo the insane directory structure
    cd "${pkgdir}/usr/share/webapps/phpoffice/"

    # zip messes up the permissions
    find -type f -exec chmod 644 '{}' ';'
    find -type d -exec chmod 755 '{}' ';'

    install -Dpm644 'license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm 'license.txt' 'changelog.txt' 'install.txt'
    install -d "${pkgdir}/usr/share/doc/phpoffice/${_pkgname}"
    mv 'Documentation' 'Examples' "${pkgdir}/usr/share/doc/phpoffice/${_pkgname}"
    if [ "${_opt_buildphar}" -ne 0 ]; then
      mv "Classes/${_pkgname}.php" .
      rm -rf 'Classes'
      cp -p "${_release}/${_pkgname}_${pkgver}.phar" .
      local _addphar=''
    else
      mv Classes/* .
      rmdir Classes
      case "${_pkgname}" in
      PHPExcel) ln -sf "${_pkgname}.php" "${pkgdir}/usr/share/webapps/phpoffice/${_pkgname}.phar";;
      *) echo "Unsupported package ${_pkgname}"; false;;
      esac
      local _addphar='#'
    fi
  fi
  # Enable extensions
  if [ "${_pkgname}" != 'Common' ]; then
    install -Dpm644 <(cat <<EOF
; Installed by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
; https://aur.archlinux.org/
extension=xsl.so
extension=zip.so
extension=gd.so
EOF
    ) "${pkgdir}/etc/php/conf.d/${pkgname}.cfg"
  fi
  set +u
}
set +u
