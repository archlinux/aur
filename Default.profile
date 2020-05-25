[cubeaddon]
s0_reflection = false
s0_deformation = 2
s0_deform_caps = false
s0_draw_top = false
s0_draw_bottom = false
s0_top_images = ;
s0_bottom_images = ;

[cube]
s0_top_color = #00000000
s0_bottom_color = #00000000
s0_skydome_animated = true
s0_active_opacity = 0.000000
s0_inactive_opacity = 0.000000
s0_transparent_manual_only = false

[decor]
s0_mipmap = true

[obs]
s0_opacity_matches = class=Io.elementary.* | class=Epiphany | class=Firefox | class=Transmission-gtk;class=Pavucontrol | class=Ccsm | class=Switchboard | class=Dconf-editor;class=Io.elementary.notifications | class=Wingpanel;
s0_opacity_values = 90;90;90;0;

[shift]
s0_mipmaps = true

[place]
s0_position_matches = class=Io.elementary.notifications;
s0_position_x_values = 1920;
s0_position_y_values = 96;
s0_position_constrain_workarea = true;
s0_viewport_matches = class=Firefox | class=Epiphany;class=Io.elementary.files | class=Io.elementary.music;class=Io.elementary.videos | class=mpv | class=Io.elementary.terminal | class=Polari;class=Io.elementary.code;
s0_viewport_x_values = 1;2;3;4;
s0_viewport_y_values = 1;1;1;1;

[expo]
s0_expo_key = <Super>Down
s0_expo_edge = 
s0_next_vp_button = Button7
s0_prev_vp_button = Button6
s0_expo_animation = 3
s0_hide_docks = true
s0_mipmaps = true
s0_reflection = false

[mousepoll]
s0_mouse_poll_interval = 100

[core]
s0_active_plugins = core;composite;opengl;place;regex;resize;text;titleinfo;winrules;workspacenames;commands;compiztoolbox;cube;firepaint;grid;imgjpeg;imgpng;mousepoll;move;neg;obs;rotate;staticswitcher;thumbnail;wallpaper;cubeaddon;expo;
s0_outputs = 1920x1080+0+0;1920x1080+0+0;

[firepaint]
s0_initiate_button = Button8
s0_clear_button = Button2
s0_bg_brightness = 100.000000
s0_fire_size = 6.000000

[winrules]
s0_skiptaskbar_match = class=Io.elementary.notifications
s0_skippager_match = class=Io.elementary.notifications
s0_above_match = class=Wingpanel | class=Plank | class=Io.elementary.notifications | class=Io.elementary.desktop.agent-polkit
s0_below_match = class=Io.elementary.videos | class=Firefox | class=Epiphany | class=Io.elementary.mail | class=Io.elementary.files | class=Io.elementary.terminal | class=mpv | class=Io.elementary.music | class=Io.elementary.code
s0_sticky_match = class=Io.elementary.notifications
s0_fullscreen_match = class=Io.elementary.videos | class=mpv
s0_maximize_match = class=Epiphany | class=Io.elementary.files | class=Firefox | class=mpv | class=Io.elementary.music | class=Io.elementary.code
s0_no_focus_match = class=Wingpanel | class=Plank

[resize]
s0_mode = 1

[move]
s0_opacity = 90
s0_snapoff_distance = 150
s0_snapback_semimaximized = false
s0_lazy_positioning = true

[workarounds]
s0_keep_minimized_windows = true
s0_legacy_fullscreen = true
s0_notification_daemon_fix = true
s0_qt_fix = true
s0_no_wait_for_video_sync = true
s0_initial_damage_complete_redraw = false

[rotate]
s0_raise_on_rotate = true
s0_flip_time = 0
s0_speed = 8.000000
s0_initiate_button = Button9
s0_rotate_left_button = Button6
s0_rotate_right_button = Button7
s0_rotate_to_1_key = <Super>Home

[blur]
s0_filter = 2

[composite]
s0_refresh_rate = 50
s0_unredirect_fullscreen_windows = false

[opengl]
s0_texture_filter = 2

[thumbnail]
s0_window_like = false
s0_mipmap = true
s0_current_viewport = false
s0_title_enabled = false

[commands]
s0_command0 = wingpanel -t app-launcher
s0_command1 = compiz-cube-screensaver
s0_command2 = io.elementary.screenshot-tool -s
s0_command3 = io.elementary.terminal
s0_run_command0_key = <Super>space
s0_run_command1_key = <Super>l
s0_run_command2_key = Print
s0_run_command3_key = <Control><Alt>t

[staticswitcher]
s0_next_key = Disabled
s0_prev_key = Disabled
s0_next_all_key = <Alt>Tab
s0_prev_all_key = <Shift><Alt>Tab
s0_opacity = 30
s0_focus_on_switch = true
s0_highlight_mode = 0
s0_highlight_rect_hidden = 2
s0_background_color = #33333300

[workspacenames]
s0_names = Front;Right;Back;Left;
s0_display_time = 0.250000
s0_fade_time = 0.125000
s0_bold_text = false
s0_text_font_size = 12
s0_back_color = #0000004c

[grid]
s0_top_left_corner_action = 7
s0_top_edge_action = 8
s0_top_right_corner_action = 9
s0_bottom_left_corner_action = 1
s0_bottom_edge_action = 2
s0_bottom_right_corner_action = 3
s0_left_edge_threshold = 100
s0_right_edge_threshold = 100
s0_top_edge_threshold = 100
s0_bottom_edge_threshold = 100
s0_animation_duration = 250

[wallpaper]
s0_bg_image = ;
s0_bg_image_pos = 0;
s0_bg_fill_type = 0;
s0_bg_color1 = #00000000;
s0_bg_color2 = #00000000;

[wobbly]
s0_snap_inverted = true
s0_shiver = true
s0_map_effect = 1
s0_focus_effect = 1

[scale]
s0_overlay_icon = 2

[gnomecompat]
s0_main_menu_key = Disabled
s0_command_screenshot = io.elementary.screenshot-tool -s
s0_command_window_screenshot = io.elementary.screenshot-tool -w
s0_command_terminal = io.elementary.terminal
s0_run_command_terminal_key = <Control><Alt>t

