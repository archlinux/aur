# Contributor: Red_Squirrel <evangelion87d@gmail.com>
# Contributor: Xavier114fch <xavier114fch@gmail.com>
# Contributor: nachoig      <areta@outlook.com.br>
# Contributor: nTia89       <mattia.b89@gmail.com>
# Contributor: Mark E. Lee  <mark@markelee.com>
# Maintainer : Mark E. Lee  <mark@markelee.com>

## Changelog :
## changed build function to package function (since nothing is built)
## removed rpmextract dependency since bsdtar can already extract rpms (per Red_Squirrel's advice)
## removed double posting query
## fixed up pkgver and pkgrel variables
## updated to libreoffice 4.0.1
## added libnp12 as a dependency due to <https://bugassistant.libreoffice.org/show_bug.cgi?id=61571> as reported by xavier114fch
## fixed up some file permissions for :
##    FILE/DIR                        PERMISSIONS
##    --------                        -----------
##    /usr/bin/                          755
##    /opt/libreoffice4.0/LICENSE        644
##    /opt/libreoffice4.0/CREDITS.odt    644
##    /opt/libreoffice4.0/LICENSE.odt    644
## Using package defaults for rest
## Updated to pkgver 4.0.2
## Updated to pkgver 4.0.3
## Updated to pkgver 4.0.4
## Changed ${pkgver%.3} to $(echo $pkgver | awk -F'.' 'OFS="." {print $1,$2}')  for easy upgrades (just change the pkver and pkgrel variable)
## Updated to pkgver 4.1.0
## Moved language packs to prepare function
## removed code to extract 4.0 desktop integration; it is now extracted in a usr directory; added code to copy the usr directory
## changed directory copying code to copy all */ in the RPMS directories
## updated to upstream 4.1.1
## updated to upstream 4.1.2
## updated to upstream 4.1.3
## updated to upstream 4.1.4
## switched to sha256 sums + PGP sigs (see mailing list : <https://mailman.archlinux.org/pipermail/arch-general/2014-January/034744.html>)
## using custom linux kernel version check in package() due usage of custom kernels (the issue was brought up by nachoig, the fix was from Mark E. Lee)
## updated to upstream 4.2.0
## using curl instead of wget due to Arch upstream change as requested by nTia89
## updated to upstream 4.2.1
## updated to upstream 4.2.2
## updated to upstream 4.2.3
## updated to upstream 4.2.4
## updated to upstream 4.2.5
## removed gnome from opt-depends and added gstreamer0.10-plugins per nachoig's suggestion
## removed gstreamer0.10-plugins and added gst-plugins per nachoig's suggestion
## updated to upstream 4.3.0
## changed pkgname to libreoffice-fresh-rpm per nachoig's suggestion
## updated to upstream 4.3.1
## updated to upstream 4.3.2
## updated to upstream 4.3.3
## updated to upstream 4.3.4
## updated to upstream 4.3.5
## updated to upstream 4.4.0
## temporarily removing GPG sig checks
## updated to upstream 4.4.1
## updated to upstream 4.4.2
## updated to remove "Y2K" problem. Credit to Tomasz Przybył for reporting the error. Credit to Mark Lee for identifying the cause and fix.
## updated to upstream 4.4.3
## updated to upstream 4.4.4
## updated to upstream 5.0.0

pkgname=libreoffice-fresh-rpm
pkgver=5.0.0
pkgrel=1
pkgdesc="LGPL Office Suite installed from rpms"
arch=('i686' 'x86_64')
url='http://www.libreoffice.org'
license=('LGPL')
depends=('glibc>=2.5' 'gtk2>=2.10.4' 'xorg-server')
makedepends=('curl' 'awk')
optdepends=('jre7-openjdk' 'gtk3' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
if [ "$(uname -m)" == "i686" ]; then  ## convert bit architecture to libreoffice format
  arch_mod='x86';
  sha256sums+=('9278536db8ccc20b0524a59b87c6cfd65ccd9d0de8668333af076e1b0f61d256');
  source+=("https://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/${arch_mod}/LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm.tar.gz")
 else
  arch_mod='x86_64';
  sha256sums+=('9d32f4798bda0879c28b2b4b7c2c8d037e6e20c40b01f9b71e8ab9080d6a1703')
  source+=("https://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/${arch_mod}/LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm.tar.gz")
fi;

prepare() { ## prepare function

## install optional language & help packs (queries user)
curl "http://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/${arch_mod}/" -o index.html;  ## get index.html
declare -ar opt_pak=('langpack' 'helppack');  ## declare optional extensions
for a in ${opt_pak[@]}; do  ## loop for all optional extensions
  read -p "Do you want to install additional ${a} (Y/y/N/n)?" opt_ans;
  case $opt_ans in  ## evaluate the answer
    Y|y)
       echo "Which ${a} do you want to install?";
       ## generate a menu for all available packages
       select opt_ext in $(cat index.html | awk -F'_' "/${a}/ && !/.asc/ {print \$7}" | awk -F'.' '{print $1}'); do
         ## download the rpm package
         msg "Retrieving LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz...";
         curl -L -O "http://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/${arch_mod}/LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz"; 
         ## download the rpm sha256
         curl -L -O "http://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/${arch_mod}/LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz.sha256";
         ## check the sha256 sum for the package
         msg "Done";
         msg "Validating LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz with sha256sum...";
         sha256sum -c "LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz.sha256"
         if [ ! $? -eq 0 ]; then  ## check the sha256sum error
            echo "Failed sha256sum check for http://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/${arch_mod}/LibreOffice_${pkgver}_Linux_${arch_mod/_/-}_rpm_${a}_${opt_ext}.tar.gz";
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
  declare -a wrongexec=("opt/libreoffice$(echo $pkgver | awk -F'.' 'OFS="." {print $1,$2}')/CREDITS.fodt" "opt/libreoffice$(echo $pkgver | awk -F'.' 'OFS="." {print $1,$2}')/LICENSE.fodt" "opt/libreoffice$(echo $pkgver | awk -F'.' 'OFS="." {print $1,$2}')/NOTICE");  ## set the array to change permissions
  for a in ${wrongexec[@]}; do
    chmod 644 ${pkgdir}/$a; ## change permissions to read/write for root, read only for users
  done;
done;

}
