cmake_minimum_required(VERSION 3.9)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(gme VERSION 0.7.0 DESCRIPTION "Game Music Emulator Library")

set(GME_SOURCES
    gme/higan/dsp/SPC_DSP.cpp
    gme/higan/processor/spc700/spc700.cpp
    gme/higan/dsp/dsp.cpp
    gme/higan/smp/smp.cpp
    gme/Ay_Apu.cpp
    gme/Ay_Core.cpp
    gme/Ay_Cpu.cpp
    gme/Ay_Emu.cpp
    gme/Bml_Parser.cpp
    gme/blargg_common.cpp
    gme/blargg_errors.cpp
    gme/Blip_Buffer.cpp
    gme/Classic_Emu.cpp
    gme/Downsampler.cpp
    gme/Dual_Resampler.cpp
    gme/Effects_Buffer.cpp
    gme/Fir_Resampler.cpp
    gme/Gb_Apu.cpp
    gme/Gb_Cpu.cpp
    gme/Gb_Oscs.cpp
    gme/Gbs_Core.cpp
    gme/Gbs_Cpu.cpp
    gme/Gbs_Emu.cpp
    gme/gme.cpp
    gme/Gme_File.cpp
    gme/Gme_Loader.cpp
    gme/Gym_Emu.cpp
    gme/Hes_Apu.cpp
    gme/Hes_Apu_Adpcm.cpp
    gme/Hes_Core.cpp
    gme/Hes_Cpu.cpp
    gme/Hes_Emu.cpp
    gme/Kss_Core.cpp
    gme/Kss_Cpu.cpp
    gme/Kss_Emu.cpp
    gme/Kss_Scc_Apu.cpp
    gme/M3u_Playlist.cpp
    gme/Multi_Buffer.cpp
    gme/Music_Emu.cpp
    gme/Nes_Apu.cpp
    gme/Nes_Cpu.cpp
    gme/Nes_Fds_Apu.cpp
    gme/Nes_Fme7_Apu.cpp
    gme/Nes_Namco_Apu.cpp
    gme/Nes_Oscs.cpp
    gme/Nes_Vrc6_Apu.cpp
    gme/Nes_Vrc7_Apu.cpp
    gme/Nsf_Core.cpp
    gme/Nsf_Cpu.cpp
    gme/Nsf_Emu.cpp
    gme/Nsf_Impl.cpp
    gme/Nsfe_Emu.cpp
    gme/Opl_Apu.cpp
    gme/Resampler.cpp
    gme/Rom_Data.cpp
    gme/Sap_Apu.cpp
    gme/Sap_Core.cpp
    gme/Sap_Cpu.cpp
    gme/Sap_Emu.cpp
    gme/Sgc_Core.cpp
    gme/Sgc_Cpu.cpp
    gme/Sgc_Emu.cpp
    gme/Sgc_Impl.cpp
    gme/Sms_Apu.cpp
    gme/Sms_Fm_Apu.cpp
    gme/Spc_Emu.cpp
    gme/Spc_Filter.cpp
    gme/Spc_Sfm.cpp
    gme/Track_Filter.cpp
    gme/Upsampler.cpp
    gme/Vgm_Core.cpp
    gme/Vgm_Emu.cpp
    gme/Ym2413_Emu.cpp
    gme/Ym2612_Emu.cpp
    gme/Z80_Cpu.cpp
    vgmplay/VGMPlay/ChipMapper.c
    vgmplay/VGMPlay/chips/2151intf.c
    vgmplay/VGMPlay/chips/2203intf.c
    vgmplay/VGMPlay/chips/2413intf.c
    vgmplay/VGMPlay/chips/2608intf.c
    vgmplay/VGMPlay/chips/2610intf.c
    vgmplay/VGMPlay/chips/2612intf.c
    vgmplay/VGMPlay/chips/262intf.c
    vgmplay/VGMPlay/chips/3526intf.c
    vgmplay/VGMPlay/chips/3812intf.c
    vgmplay/VGMPlay/chips/8950intf.c
    vgmplay/VGMPlay/chips/adlibemu_opl2.c
    vgmplay/VGMPlay/chips/adlibemu_opl3.c
    vgmplay/VGMPlay/chips/ay8910.c
    vgmplay/VGMPlay/chips/ay_intf.c
    vgmplay/VGMPlay/chips/c140.c
    vgmplay/VGMPlay/chips/c352.c
    vgmplay/VGMPlay/chips/c6280.c
    vgmplay/VGMPlay/chips/c6280intf.c
    vgmplay/VGMPlay/chips/dac_control.c
    vgmplay/VGMPlay/chips/emu2149.c
    vgmplay/VGMPlay/chips/emu2413.c
    vgmplay/VGMPlay/chips/es5503.c
    vgmplay/VGMPlay/chips/es5506.c
    vgmplay/VGMPlay/chips/fm.c
    vgmplay/VGMPlay/chips/fm2612.c
    vgmplay/VGMPlay/chips/fmopl.c
    vgmplay/VGMPlay/chips/gb.c
    vgmplay/VGMPlay/chips/iremga20.c
    vgmplay/VGMPlay/chips/k051649.c
    vgmplay/VGMPlay/chips/k053260.c
    vgmplay/VGMPlay/chips/k054539.c
    vgmplay/VGMPlay/chips/multipcm.c
    vgmplay/VGMPlay/chips/nes_apu.c
    vgmplay/VGMPlay/chips/nes_intf.c
    vgmplay/VGMPlay/chips/np_nes_apu.c
    vgmplay/VGMPlay/chips/np_nes_dmc.c
    vgmplay/VGMPlay/chips/np_nes_fds.c
    vgmplay/VGMPlay/chips/okim6258.c
    vgmplay/VGMPlay/chips/okim6295.c
    vgmplay/VGMPlay/chips/Ootake_PSG.c
    vgmplay/VGMPlay/chips/panning.c
    vgmplay/VGMPlay/chips/pokey.c
    vgmplay/VGMPlay/chips/pwm.c
    vgmplay/VGMPlay/chips/qsound.c
    vgmplay/VGMPlay/chips/rf5c68.c
    vgmplay/VGMPlay/chips/saa1099.c
    vgmplay/VGMPlay/chips/scd_pcm.c
    vgmplay/VGMPlay/chips/scsp.c
    vgmplay/VGMPlay/chips/segapcm.c
    vgmplay/VGMPlay/chips/sn76489.c
    vgmplay/VGMPlay/chips/sn76496.c
    vgmplay/VGMPlay/chips/sn764intf.c
    vgmplay/VGMPlay/chips/upd7759.c
    vgmplay/VGMPlay/chips/vsu.c
    vgmplay/VGMPlay/chips/ws_audio.c
    vgmplay/VGMPlay/chips/x1_010.c
    vgmplay/VGMPlay/chips/yam.c
    vgmplay/VGMPlay/chips/ym2151.c
    vgmplay/VGMPlay/chips/ym2413.c
    vgmplay/VGMPlay/chips/ym2612.c
    vgmplay/VGMPlay/chips/ymdeltat.c
    vgmplay/VGMPlay/chips/ymf262.c
    vgmplay/VGMPlay/chips/ymf271.c
    vgmplay/VGMPlay/chips/ymf278b.c
    vgmplay/VGMPlay/chips/ymz280b.c
    vgmplay/VGMPlay/resampler.c
    vgmplay/VGMPlay/VGMPlay.c
    file_extractor/fex/Data_Reader.cpp
    file_extractor/fex/blargg_errors.cpp
)

add_library(gmeobj OBJECT ${GME_SOURCES})
set_property(TARGET gmeobj PROPERTY POSITION_INDEPENDENT_CODE 1)
add_library(gme_shared SHARED $<TARGET_OBJECTS:gmeobj>)
add_library(gme_static STATIC $<TARGET_OBJECTS:gmeobj>)

target_compile_definitions(gmeobj PRIVATE BLARGG_NAMESPACE=GME)
find_package(ZLIB REQUIRED)
include_directories(${ZLIB_INCLUDE_DIRS})
target_include_directories(gmeobj PRIVATE gme file_extractor/fex)
set_target_properties(gme_shared PROPERTIES VERSION ${PROJECT_VERSION})
set_target_properties(gme_static PROPERTIES VERSION ${PROJECT_VERSION})

set_target_properties(gme_shared PROPERTIES PUBLIC_HEADER gme/gme.h)
set_target_properties(gme_static PROPERTIES PUBLIC_HEADER gme/gme.h)

SET_TARGET_PROPERTIES(gme_static PROPERTIES OUTPUT_NAME gme CLEAN_DIRECT_OUTPUT 1)
SET_TARGET_PROPERTIES(gme_shared PROPERTIES OUTPUT_NAME gme CLEAN_DIRECT_OUTPUT 1)
target_link_libraries(gme_shared ${ZLIB_LIBRARIES} )

include(GNUInstallDirs)

install(TARGETS gme_shared
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/gme
)

install(TARGETS gme_static
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/gme
)
