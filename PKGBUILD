# Maintainer: insmtr <insmtr@insmtr.cn>

pkgname=mworks-sysplorer
pkgver=26.2.1
pkgrel=1
pkgdesc="MWORKS.Sysplorer 是面向多领域工业产品的系统建模与仿真验证环境，全面支持多领域统一建模规范 Modelica"
arch=('x86_64')
url="https://www.tongyuan.cc/"
license=('custom:proprietary')

# 运行时依赖：Qt、CEF、系统基础库
depends=(
    'gtk3' 'nss' 'alsa-lib' 'libxtst' 'libxss' 'libxcomposite' 'libxdamage' 'libxrandr' 'libxkbcommon'
    'pango' 'cairo' 'glib2' 'at-spi2-core' 'cups' 'dbus' 'expat' 'fontconfig' 'freetype2' 'glibc' 'gcc-libs' 'zlib' 'bzip2' 'xz' 'zstd'
)

options=('!debug' '!strip' '!emptydirs')
install="${pkgname}.install"
makedepends=('pyinstxtractor-ng-git' 'patchelf')

_release="2026a"
_build="1206"
_runfile="Sysplorer-${_release}-${pkgver}-linux-x64.run"

source=("https://releases.tongyuan.cc/installer/sysplorer/${_release}/MWORKS.Sysplorer-${_release}-${pkgver}.${_build}-linux-x64.tar.gz"
        "mworks-sysplorer-help.desktop")
sha256sums=('4e4752f8c711182ca6a493a83b4b4d359b794bf37dccd66b619d5e26b664b590'
            'd390ad461031ff99fca614b6ba3f54a1b834e2379cadf71e805457a6db8639e3')

_instdir="/opt/mworks-sysplorer"

prepare() {
    cd "$srcdir"
    pyinstxtractor-ng "$_runfile"
}

_extract() {
    local src="$1"
    local dest="$pkgdir$2"
    install -dm755 "$dest"
    tar -xf "$src" -C "$dest"
}

package() {
    local datadir="$srcdir/data"
    local _extracted="$srcdir/${_runfile}_extracted/releases/sysplorer"

    # 核心主程序
    _extract "$datadir/Sysplorer_Bin_main.centos_official.x86_64.tar.zst" "$_instdir/bin64"
    _extract "$datadir/External_main.centos_official.x86_64.tar.zst"      "$_instdir/external"
    _extract "$datadir/Initial_Files_main.centos_official.x86_64.tar.zst" "$_instdir/initial_files"
    _extract "$datadir/Setting_main.centos_official.x86_64.tar.zst"       "$_instdir/setting"
    _extract "$datadir/Simulator_main.centos_official.x86_64.tar.zst"     "$_instdir/Simulator"
    _extract "$datadir/Tools_main.centos_official.x86_64.tar.zst"         "$_instdir/Tools"
    _extract "$datadir/LicenseTools_main.tar.zst"                         "$_instdir/Tools/LicenseTools"
    _extract "$datadir/Coder_main.centos_official.x86_64.tar.zst"         "$_instdir/coder"

    # 帮助文档
    _extract "$datadir/Docs.tar.zst"                                      "$_instdir/Docs"

    # 插件
    _extract "$datadir/Syslab_toolkit.centos_official.x86_64.tar.zst"     "$_instdir/bin64/Addins/syslab_toolkit"
    _extract "$datadir/Model_Linearizer.centos_official.x86_64.tar.zst"   "$_instdir/bin64/Addins/syslineest"
    _extract "$datadir/Ctrsysdesign.centos_official.x86_64.tar.zst"       "$_instdir/bin64/Addins/ctrsysdesign"
    _extract "$datadir/File_explorer.centos_official.x86_64.tar.zst"      "$_instdir/bin64/Addins/fileexplorer"
    _extract "$datadir/Text_Comparision.centos_official.x86_64.tar.zst"   "$_instdir/bin64/Addins/text_comparision"
    _extract "$datadir/Cad_toolbox.centos_official.x86_64.tar.zst"        "$_instdir/bin64/Addins/cad_toolbox"
    _extract "$datadir/Simulink_Importer.centos_official.x86_64.tar.zst"  "$_instdir/bin64/Addins/mw_simulink_importer"
    _extract "$datadir/Powergui_addin.centos_official.x86_64.tar.zst"     "$_instdir/bin64/Addins/mw_powergui_addins"
    _extract "$datadir/MwMex.centos_official.x86_64.tar.zst"              "$_instdir/bin64/Addins/mw_mex"
    _extract "$datadir/SysblockTest.centos_official.x86_64.tar.zst"       "$_instdir/bin64/Addins/sysblock_test"
    _extract "$datadir/PythonIO_addins.centos_official.x86_64.tar.zst"    "$_instdir/bin64/Addins/mw_python_io_addins"

    # 模型库
    # Python IO
    _extract "$datadir/PythonIO_1_0.tar.zst"                              "$_instdir/Library/PythonIO 1.0"

    # Modelica 标准库
    _extract "$datadir/Modelica_4_0.tar.zst"                              "$_instdir/Library/Modelica 4.0"
    _extract "$datadir/Modelica_3_2_3.tar.zst"                            "$_instdir/Library/Modelica 3.2.3"
    _extract "$datadir/Modelica_3_2_1.tar.zst"                            "$_instdir/Library/Modelica 3.2.1"
    _extract "$datadir/Modelica_3_2.tar.zst"                              "$_instdir/Library/Modelica 3.2"
    _extract "$datadir/Modelica_2_2_2.tar.zst"                            "$_instdir/Library/Modelica 2.2.2"
    _extract "$datadir/Modelica_4_0_0_TY_1.tar.zst"                       "$_instdir/Library/Modelica 4.0.0.TY.1"
    _extract "$datadir/ModelicaReference_4_0.tar.zst"                     "$_instdir/Library/ModelicaReference 4.0"
    _extract "$datadir/ModelicaReference_3_2_3.tar.zst"                   "$_instdir/Library/ModelicaReference 3.2.3"

    # 工作区 & 动态仪表
    _extract "$datadir/SyslabWorkspace_1_0.tar.zst"                       "$_instdir/Library/SyslabWorkspace 1.0"
    _extract "$datadir/DynamicBlocks_1_0_0.tar.zst"                       "$_instdir/Library/DynamicBlocks 1.0.0"
    _extract "$datadir/SysplorerEmbeddedCoder_2_0.tar.zst"                "$_instdir/Library/SysplorerEmbeddedCoder 2.0"

    # TY 液压 & 热液压
    _extract "$datadir/TYHydraulicComponents_2_5_0.tar.zst"               "$_instdir/Library/TYHydraulicComponents 2.5.0"
    _extract "$datadir/TYHydraulics_2_4_0.tar.zst"                        "$_instdir/Library/TYHydraulics 2.4.0"
    _extract "$datadir/TYThermalHydraulicComponents_1_5_0.tar.zst"        "$_instdir/Library/TYThermalHydraulicComponents 1.5.0"
    _extract "$datadir/TYThermalHydraulics_1_3_0.tar.zst"                 "$_instdir/Library/TYThermalHydraulics 1.3.0"
    _extract "$datadir/TYOilMedia_2_3_0.tar.zst"                          "$_instdir/Library/TYOilMedia 2.3.0"

    # TY 机械
    _extract "$datadir/TYMechanics_1_2_0.tar.zst"                         "$_instdir/Library/TYMechanics 1.2.0"
    _extract "$datadir/TYMechanics2D_1_1_0.tar.zst"                       "$_instdir/Library/TYMechanics2D 1.1.0"
    _extract "$datadir/TYMultibody_1_5_0.tar.zst"                         "$_instdir/Library/TYMultibody 1.5.0"
    _extract "$datadir/TYDriveline_2_1_0.tar.zst"                         "$_instdir/Library/TYDriveline 2.1.0"
    _extract "$datadir/TYDriveline3D_2_1_0.tar.zst"                       "$_instdir/Library/TYDriveline3D 2.1.0"
    _extract "$datadir/TYContact_1_3_0.tar.zst"                           "$_instdir/Library/TYContact 1.3.0"
    _extract "$datadir/TYFlexBody_1_1_0.tar.zst"                          "$_instdir/Library/TYFlexBody 1.1.0"

    # TY 气动 & 流体
    _extract "$datadir/TYPneumatics_2_1_0.tar.zst"                        "$_instdir/Library/TYPneumatics 2.1.0"
    _extract "$datadir/TYPneumaticComponents_2_3_0.tar.zst"               "$_instdir/Library/TYPneumaticComponents 2.3.0"
    _extract "$datadir/TYGasMedia_2_0_2.tar.zst"                          "$_instdir/Library/TYGasMedia 2.0.2"
    _extract "$datadir/TYFuelCellSys_1_1_0.tar.zst"                       "$_instdir/Library/TYFuelCellSys 1.1.0"
    _extract "$datadir/TYMedia_1_4_0.tar.zst"                             "$_instdir/Library/TYMedia 1.4.0"
    _extract "$datadir/TYThermals_1_1_0.tar.zst"                          "$_instdir/Library/TYThermals 1.1.0"
    _extract "$datadir/TYThermoFluidSys_1_3_0.tar.zst"                    "$_instdir/Library/TYThermoFluidSys 1.3.0"
    _extract "$datadir/TYAirTreatmentAndVentilation_1_1_0.tar.zst"        "$_instdir/Library/TYAirTreatmentAndVentilation 1.1.0"

    # TY 电气 & 电力
    _extract "$datadir/TYElectrical_1_2_0.tar.zst"                        "$_instdir/Library/TYElectrical 1.2.0"
    _extract "$datadir/TYElectricPower_1_2_0.tar.zst"                     "$_instdir/Library/TYElectricPower 1.2.0"
    _extract "$datadir/TYMotor_2_2_0.tar.zst"                             "$_instdir/Library/TYMotor 2.2.0"
    _extract "$datadir/TYMixedSignal_1_0_2.tar.zst"                       "$_instdir/Library/TYMixedSignal 1.0.2"
    _extract "$datadir/TYCommunication_1_0_3.tar.zst"                     "$_instdir/Library/TYCommunication 1.0.3"
    _extract "$datadir/TYDSPSystem_1_0_3.tar.zst"                         "$_instdir/Library/TYDSPSystem 1.0.3"
    _extract "$datadir/NPSLibrary_1_3_0.tar.zst"                          "$_instdir/Library/NPSLibrary 1.3.0"

    # TY 能源 & 专业领域
    _extract "$datadir/TYBattery_1_0_0.tar.zst"                           "$_instdir/Library/TYBattery 1.0.0"
    _extract "$datadir/TYIntegratedEnergySys_1_1_0.tar.zst"               "$_instdir/Library/TYIntegratedEnergySys 1.1.0"
    _extract "$datadir/TYWindPower_1_1_0.tar.zst"                         "$_instdir/Library/TYWindPower 1.1.0"
    _extract "$datadir/TYPhotovoltaicPower_1_1_0.tar.zst"                 "$_instdir/Library/TYPhotovoltaicPower 1.1.0"
    _extract "$datadir/TYWebHandling_1_1_0.tar.zst"                       "$_instdir/Library/TYWebHandling 1.1.0"
    _extract "$datadir/TYAircraftFuelSys_1_0_0.tar.zst"                   "$_instdir/Library/TYAircraftFuelSys 1.0.0"

    # TA 车辆系列
    _extract "$datadir/TYBase_1_0_8.tar.zst"                              "$_instdir/Library/TYBase 1.0.8"
    _extract "$datadir/TABattery_1_2_0.tar.zst"                           "$_instdir/Library/TABattery 1.2.0"
    _extract "$datadir/TADynamics_1_3_1.tar.zst"                          "$_instdir/Library/TADynamics 1.3.1"
    _extract "$datadir/TAEconomy_1_3_1.tar.zst"                           "$_instdir/Library/TAEconomy 1.3.1"
    _extract "$datadir/TAElectronic_1_3_0.tar.zst"                        "$_instdir/Library/TAElectronic 1.3.0"
    _extract "$datadir/TAEngine_1_2_0.tar.zst"                            "$_instdir/Library/TAEngine 1.2.0"
    _extract "$datadir/TAThermalSystem_1_2_0.tar.zst"                     "$_instdir/Library/TAThermalSystem 1.2.0"

    # 版本信息文件
    install -Dm644 "$_extracted/build_info.json" "$pkgdir$_instdir/versionInfo/build_info.json"

    # 启动器图标
    install -Dm644 "$_extracted/assets/images/logo.png" "$pkgdir$_instdir/Install/config/logo.png"

    # 为每个 Library 子目录创建空的 MWORKSCustomLibrary.ini 标记文件
    find "$pkgdir$_instdir/Library" -mindepth 1 -maxdepth 1 -type d -exec touch "{}/MWORKSCustomLibrary.ini" \;

    # 桌面快捷方式
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/mworks-sysplorer.desktop" << EOF
[Desktop Entry]
Name=MWORKS.Sysplorer $_release
Exec=$_instdir/bin64/mworks.sh
Icon=$_instdir/Install/config/logo.png
Terminal=false
Type=Application
Categories=Development;
EOF

    # 帮助文档快捷方式（Sysplorer 帮助中心在 Linux 上存在 bug 无法工作，提供独立 .desktop 入口，直接用系统浏览器打开静态文档页面）
    install -Dm644 "$srcdir/mworks-sysplorer-help.desktop" "$pkgdir/usr/share/applications/${pkgname}-help.desktop"

    # 修复捆绑 Python 找不到 libtk/libtcl 的问题：
    # libtk8.5.so 在 bin64/，但 Python 二进制没有 RPATH，直接调用时动态链接器找不到该库。
    # 通过 patchelf 写入相对 RPATH，使 Python 无论从哪里调用都能定位到 bin64/。
    patchelf --set-rpath '$ORIGIN/../../../bin64' "$pkgdir$_instdir/external/python64/bin/python3"
}
