## Release 0.18.1 on 2022-05-23

- Add missing desktop file to autostart the notifier.

## Release 0.18.0 on 2022-05-23

- pacautomation's functionality was split in two systems: `pacautomation` 
  handles the various automated service tasks in the background and is run with
  root privileges. It's triggered by a persistent systemd timer.
  `pacautomation-notify` checks for and displays pending desktop notifications.
  It is run for each user upon login or triggered after `pacautomation` 
  completes. This allows users to receive notifications even if they weren't
  logged in while `pacautomation` was run.
- Restrict the privileges and capabilities of the included systemd services.
  E.g. this prevents access to directories such as `/home` or `/root` for 
  `pacautomation.service`.
- Make pacautomation available as an Python package in the system's Python
  environment.
- Add a new desktop notification type for warnings.
