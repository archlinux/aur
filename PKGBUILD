# Maintainer : Uwe Grasshoff <aurpackages@crazyideas.dee>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Red_Squirrel <evangelion87d@gmail.com>
# Contributor: Xavier114fch <xavier114fch@gmail.com>
# Contributor: nachoig      <areta@outlook.com.br>
# Contributor: nTia89       <mattia.b89@gmail.com>
# Contributor: Mark E. Lee  <mark@markelee.com>

## Check for new LibreOffice releases:
# $ wget "https://download.documentfoundation.org/libreoffice/stable/" -q -O /tmp/lo.html && echo "LibreOffice versions" && awk '{print $3;}' /tmp/lo.html|cut -b 7-11|grep --color=never [0-9].[0-9].[0-9]; rm /tmp/lo.html
# site to look for the sha256sum
# https://download.documentfoundation.org/libreoffice/stable/7.1.2/rpm/x86_64/LibreOffice_7.1.2_Linux_x86-64_rpm.tar.gz.mirrorlist

pkgname=libreoffice-fresh-rpm
pkgver=7.1.2
pkgrel=2
pkgdesc="LGPL Office Suite installed from rpms"
arch=('x86_64')
url='https://www.libreoffice.org'
license=('LGPL')
depends=('glibc>=2.5' 'gtk2>=2.10.4' 'xorg-server')
conflicts=('libreoffice-fresh' 'libreoffice-base')
makedepends=('curl' 'awk')
optdepends=('jre8-openjdk' 'gtk3' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
# WARNING sha256sums values should be taken from details page about rpm.tar.gz files from servers. DO NOT USE _updpgksums_ tool.
arch_mod='x86_64';
sha256sums=('7e32b0114cd925ad30c478dd2fa49aac1a5188c162368bdf065ee897bc323b5d')
source=("https://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/${arch_mod}/LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm.tar.gz")

prepare() { ## prepare function

## install optional language & help packs (queries user)
msg "Debug: 1";
curl "http://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/${arch_mod}/" -o index.html;  ## get index.html
msg "Debug: 2";
declare -ar opt_pak=('langpack' 'helppack');  ## declare optional extensions
msg "Debug: 3";
for a in ${opt_pak[@]}; do  ## loop for all optional extensions
  read -p "Do you want to install additional ${a} (Y/y/N/n)?" opt_ans;
  case $opt_ans in  ## evaluate the answer
    Y|y)
       echo "Which ${a} do you want to install?";
       ## generate a menu for all available packages
       select opt_ext in $(cat index.html | awk -F'_' "/${a}/ && !/.asc/ {print \$7}" | awk -F'.' '{print $1}'); do
         ## download the rpm package
         msg "Retrieving LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz...";
         curl -L -O "https://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/${arch_mod}/LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz"; 
         ## download the rpm sha256
         curl -L -O "https://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/${arch_mod}/LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz.sha256";
         ## check the sha256 sum for the package
         msg "Done";
         msg "Validating LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz with sha256sum...";
         sha256sum -c "LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz.sha256"
         if [ ! $? -eq 0 ]; then  ## check the sha256sum error
            echo "Failed sha256sum check for https://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/${arch_mod}/LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz";
            exit;
          else
            msg "Done";
            ## extract the help/lang pack archive
            msg "Extracting LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz..."
            tar -xf "LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz";
            msg "Done";
         fi;
         break;  ## break the select loop
       done;
       ;;
    N|n)
       echo "Not installing additional $a";
       ;;
    *)
       echo "Not a valid answer";
       ;;
  esac;
done;

}

package() {   ## package function

## check kernel version to allow arbitrarily patched kernels
min_kernMajor=2;
min_kernMinor=6;
min_kernRelease=18;
## in bash, we need to split kernVer assigning into 2 steps
tmp_kernVer=$(uname -r);
new_kernVer=${tmp_kernVer%%-*}
kernVer=(${new_kernVer//./ });
## remove temporary variables
unset new_kernVer tmp_kernVer;

if [ ${kernVer[0]} -le $min_kernMajor ]; then
   if [ ${kernVer[1]} -le $min_kernMinor ]; then
      if [ ${kernVer[2]} -lt $min_kernRelease ]; then
         msg "The kernel version needs to be at least 2.6.18. The current kernel version is $(uname -r). Please update your linux kernel";
         exit;
      fi;
   fi;
fi;

cd ${srcdir};  ## enter the package source directory
## extract rpms and install them
for a in $(ls -d */); do  ## loop for all directories found
  cd "${srcdir}/${a}/RPMS";  ## enter the RPMS directory
  for b in *.rpm; do  ## loop for all rpm files found
    bsdtar -xf $b;  ## extract the rpm files
  done;
  
  cp -rf */ ${pkgdir}/;  ## copy and merge all found directories to the package directory

  ## change the permissions for files that shouldn't be executable
  declare -a wrongexec=("opt/libreoffice$(echo $pkgver | awk -F'.' 'OFS="." {print $1,$2}')/CREDITS.fodt" "opt/libreoffice$(echo $pkgver | awk -F'.' 'OFS="." {print $1,$2}')/LICENSE" "opt/libreoffice$(echo $pkgver | awk -F'.' 'OFS="." {print $1,$2}')/NOTICE");  ## set the array to change permissions
  for a in ${wrongexec[@]}; do
    chmod 644 ${pkgdir}/$a; ## change permissions to read/write for root, read only for users
  done;
done;

}
 
