# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>

## This PKGBUILD creates an Arch Linux package for the proprietary MATLAB application. A license from The MathWorks is needed in order to both build the package and to run MATLAB once the package is installed. In order to build the package the user must supply a plain text file installation key and the software. For network installations, in addition to the file installation key, a license file needs to be used for the installation. The ISO file can be downloaded from The MathWorks, generated from the official DVD, or created by using the interactive installer to download the toolboxes (installation can be made to a temporary directory and canceled once the toolboxes are downloaded). The contents of the ISO file must include: ./archives/ ./bin/ ./etc/ ./help/ ./java/ /sys ./activate.ini ./install ./installer_input.txt

## The default installation behavior is to install all licensed products whether or not they are available in the iso file. To install only a subset of licensed products either provide a $_products array or set $_partialinstall and remove unwanted entries from the provided $_products array. To perform a network install set $_networkinstall.

pkgname=matlab-r2010b-sp2
pkgver=07.11.02
pkgrel=1
pkgdesc='A high-level language for numerical computation and visualization'
arch=('x86_64')
url='http://www.mathworks.com'
license=(custom)
makedepends=('gendesk')
depends=('glu'
         'gstreamer0.10-base'
         'libxmu'
         'libxp'
         'libxpm'
         'libxrandr'
         'libxtst'
         'ncurses5-compat-libs'
         'portaudio')
optdepends=('xorg-fonts-100dpi: For adjustable font sizes in figures on a local xserver'
            'gcc43: For MEX support'
            'g95: For MEX support')
source=("file://${pkgname}.iso"
        "file://${pkgname}.fik")
md5sums=('SKIP'
         'SKIP')

prepare() {
  msg2 'Creating desktop file'
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --categories "Development;Education;Science;Mathematics;IDE" > /dev/null
  sed -i "/^Exec=/ s,$, -desktop," "${srcdir}/${pkgname}.desktop"

  msg2 'Extracting file installation key'
  _fik=$(grep -o [0-9-]* ${pkgname}.fik)

  msg2 'Modifying the installer settings'
  sed -i "s,^# destinationFolder=,destinationFolder=${pkgdir}/opt/tmw/${pkgname}/," "${srcdir}/installer_input.txt"
  sed -i "s,^# agreeToLicense=,agreeToLicense=yes," "${srcdir}/installer_input.txt"
  sed -i "s,^# mode=,mode=silent," "${srcdir}/installer_input.txt"
  sed -i "s,^# fileInstallationKey=,fileInstallationKey=${_fik}," "${srcdir}/installer_input.txt"
  if [ ! -z ${_networkinstall+isSet} ]; then
    sed -i "s,^# licensePath=,licensePath=${srcdir}/${pkgname}.lic," "${srcdir}/installer_input.txt"
  fi
  if [ ! -z ${_products+isSet} ]; then
    msg2 'Building a package with a subset of the licensed products.'
    for _product in "${_products[@]}"; do
      sed -i "/^#product.${_product}$/ s/^#//" "${srcdir}/installer_input.txt"
    done
  fi
}

package() {
  msg2 'Starting MATLAB installer'
  "${srcdir}/install" -t -inputFile "${srcdir}/installer_input.txt" -mode silent &> /dev/null

  msg2 'Installing license'
  install -D -m644 "${pkgdir}/opt/tmw/${pkgname}/license.txt" "${pkgdir}/usr/share/licenses/tmw/${pkgname}/LICENSE"

  msg2 'Creating links for license.lic'
  ln -s "/etc/tmw/${pkgname}/licenses/" "${pkgdir}/opt/tmw/${pkgname}/licenses"

  msg2 'Creating links for executables'
  _release=${pkgname#*-}
  install -d -m755 "${pkgdir}/usr/bin/"
  for _executable in deploytool matlab mbuild mcc mex; do
    ln -s "/opt/tmw/${pkgname}/bin/${_executable}" "${pkgdir}/usr/bin/${_executable}-${_release}"
  done

  msg2 'Installing desktop files'
  install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgdir}/opt/tmw/${pkgname}/X11/icons/matlab64c_icon.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"

  msg2 'Configuring mex options'
  sed -i "s#CC='gcc'#CC='gcc-4.3'#g" "${pkgdir}/opt/tmw/${pkgname}/bin/mexopts.sh"
  sed -i "s#CXX='g++'#CXX='g++-4.3'#g" "${pkgdir}/opt/tmw/${pkgname}/bin/mexopts.sh"

  ## See $MATLABROOT/sys/os/glnxa64/README.libstdc++
  msg2 'Removing unused library files'
  rm ${pkgdir}/opt/tmw/${pkgname}/sys/os/glnxa64/{libstdc++.so.6.0.10,libstdc++.so.6,libgcc_s.so.1,libgfortran.so.3.0.0,libgfortran.so.3}
}

## For network installations, apparently, a license file needs to be used for the installation.
if [ ! -z ${_networkinstall+isSet} ]; then
  source+="file://${pkgname}.lic"
  md5sums+='SKIP'
fi

if [ ! -z ${_partialinstall+isSet} ] && [ -z ${_products+isSet} ]; then
  _products=(
      "Aerospace_Blockset"
      "Aerospace_Toolbox"
      "Bioinformatics_Toolbox"
      "Communications_Blockset"
      "Communications_Toolbox"
      "Control_System_Toolbox"
      "Curve_Fitting_Toolbox"
      "DO_Qualification_Kit"
      "Data_Acquisition_Toolbox"
      "Database_Toolbox"
      "Datafeed_Toolbox"
      "EDA_Simulator_Link"
      "Econometrics_Toolbox"
      "Embedded_IDE_Link"
      "Filter_Design_HDL_Coder"
      "Filter_Design_Toolbox"
      "Financial_Derivatives_Toolbox"
      "Financial_Toolbox"
      "Fixed_Income_Toolbox"
      "Fixed_Point_Toolbox"
      "Fuzzy_Logic_Toolbox"
      "Gauges_Blockset"
      "Global_Optimization_Toolbox"
      "IEC_Certification_Kit"
      "Image_Acquisition_Toolbox"
      "Image_Processing_Toolbox"
      "Instrument_Control_Toolbox"
      "MATLAB"
      "MATLAB_Builder_EX"
      "MATLAB_Builder_JA"
      "MATLAB_Builder_NE"
      "MATLAB_Compiler"
      "MATLAB_Distributed_Computing_Server"
      "MATLAB_Report_Generator"
      "Mapping_Toolbox"
      "Model_Predictive_Control_Toolbox"
      "Model_Based_Calibration_Toolbox"
      "Neural_Network_Toolbox"
      "OPC_Toolbox"
      "Optimization_Toolbox"
      "Parallel_Computing_Toolbox"
      "Partial_Differential_Equation_Toolbox"
      "RF_Toolbox"
      "Real_Time_Windows_Target"
      "Real_Time_Workshop"
      "Real_Time_Workshop_Embedded_Coder"
      "Robust_Control_Toolbox"
      "Signal_Processing_Blockset"
      "Signal_Processing_Toolbox"
      "SimBiology"
      "SimDriveline"
      "SimElectronics"
      "SimEvents"
      "SimHydraulics"
      "SimMechanics"
      "SimPowerSystems"
      "SimRF"
      "Simscape"
      "Simulink"
      "Simulink_3D_Animation"
      "Simulink_Control_Design"
      "Simulink_Design_Optimization"
      "Simulink_Design_Verifier"
      "Simulink_Fixed_Point"
      "Simulink_HDL_Coder"
      "Simulink_PLC_Coder"
      "Simulink_Report_Generator"
      "Simulink_Verification_and_Validation"
      "Spreadsheet_Link_EX"
      "Stateflow"
      "Stateflow_Coder"
      "Statistics_Toolbox"
      "Symbolic_Math_Toolbox"
      "System_Identification_Toolbox"
      "SystemTest"
      "Target_Support_Package"
      "Vehicle_Network_Toolbox"
      "Video_and_Image_Processing_Blockset"
      "Wavelet_Toolbox"
      "xPC_Target"
      "xPC_Target_Embedded_Option"
  )
fi
